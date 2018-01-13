class Webpage < ApplicationRecord
  extend FriendlyId
  has_many :page_histories
  has_many :page_sources, through: :page_histories
  
  before_validation :set_uuid
  before_save :default_values
  friendly_id :uuid

  private

  def set_uuid
    self.uuid = Digest::SHA1.hexdigest([Time.now, rand].join)[0..20]
  end
  
  def default_values
    self.checked_count = 1 if self.checked_count.nil?
  end
end
