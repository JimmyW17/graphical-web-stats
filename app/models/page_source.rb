class PageSource < ApplicationRecord
  belongs_to :page_history, optional: true
  belongs_to :webpage, optional: true
end
