class AddUtmParametersToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :utm_source, :string
    add_column :urls, :utm_medium, :string
    add_column :urls, :utm_campaign, :string
    add_column :urls, :utm_term, :string
    add_column :urls, :utm_content, :string
  end
end
