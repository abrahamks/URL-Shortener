class UrlsController < ApplicationController

  before_action :set_url, only: [:show, :edit, :update, :destroy]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
    @clicks = UrlClick.group(:url_id).count
    @unique_clicks = UrlClick.group(:url_id).select(:ip).distinct.count
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    @url_clicks = UrlClick.where(url_id: @url.id)
    @url_click_days = @url_clicks.group_by {|url| url.occurred_at.to_date }
    # @utms = Rack::Utils.parse_query URI(@url.long_url).query
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create
    utms = Rack::Utils.parse_query URI(url_params['long_url']).query
    utms.slice!('utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content')
    @url = Url.new(url_params.merge(utms))
    @url.user = current_user
    respond_to do |format|
      if @url.save
        @url.update(short_url: UrlConverterService.convert_int_to_alphabet(@url.id))
        format.html { redirect_to @url, notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    utms = Rack::Utils.parse_query URI(url_params['long_url']).query
    utms.slice!('utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content')
    respond_to do |format|
      if @url.update(url_params.merge(utms))
        format.html { redirect_to @url, notice: 'Url was successfully updated.' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:long_url, :short_url, :user_id,
                                  :utm_source, :utm_medium, :utm_campaign,
                                  :utm_term, :utm_content)
    end
end
