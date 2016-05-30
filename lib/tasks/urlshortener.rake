namespace :urlshortener do
  desc 'Run a worker to do some data job from RabbitMQ'
  task worker: :environment do
    connection = Bunny.new(host: APP_CONFIG['rabbitmq_host'], port: APP_CONFIG['rabbitmq_port'])
    connection.start

    channel = connection.create_channel
    # how many messages will be given to consumers on this channel
    # before they have to acknowledge or reject one of the previously
    # consumed messages
    channel.prefetch(APP_CONFIG['rabbitmq_channel_prefetch'])
    queue = channel.queue(APP_CONFIG['rabbitmq_queue_name'])

    queue.subscribe(block: true, manual_ack: true) do |delivery_info, metadata, body|
      begin
        body = body.split("_")
        url_id = body[0]
        ip = body[1]
        occurred_at = body[2]
        puts "#{url_id} -- #{ip} -- #{occurred_at}"
        UrlClick.create(url_id: url_id,
                        ip: ip,
                        occurred_at: DateTime.strptime(occurred_at, '%s'))
        channel.acknowledge(delivery_info.delivery_tag)
      rescue => e
        Rails.logger.error "Something error while processing #{body}"
        Rails.logger.error "#{e}"
        Rails.logger.error "#{e.backtrace.join("\n\t")}"
        channel.nack(delivery_info.delivery_tag,  multiple = false, requeue = true)
      end
    end
  end
end
