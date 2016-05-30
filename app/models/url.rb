class Url < ActiveRecord::Base
  belongs_to :user
  has_many :url_clicks, dependent: :destroy
  validates :long_url, presence: true
  validates_uniqueness_of :long_url, allow_blank: false
  validates_uniqueness_of :short_url, allow_blank: false
end
