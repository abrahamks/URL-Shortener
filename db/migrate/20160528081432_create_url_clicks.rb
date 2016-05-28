class CreateUrlClicks < ActiveRecord::Migration
  def change
    create_table :url_clicks do |t|
      t.belongs_to :url, index: true, foreign_key: true, null: false
      t.inet :ip
      t.datetime :occurred_at, null: false
    end
  end
end
