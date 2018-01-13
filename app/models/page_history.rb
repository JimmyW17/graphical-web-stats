class PageHistory < ApplicationRecord
  belongs_to :webpage
  has_one :page_source

end
