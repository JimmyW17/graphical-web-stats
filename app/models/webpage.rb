class Webpage < ApplicationRecord
  before_validation :set_uuid
  before_save :default_values

  private

  def set_uuid
    self.id = SecureRandom.uuid
  end
  
  def default_values
    self.checked_count = 1 if self.checked_count.nil?
  end
end
