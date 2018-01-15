require 'rails_helper'

RSpec.describe "SubmitButtons", type: :request do
  it "submits url and gets results when submit button is clicked" do
    webpage = create(:webpage_with_page_histories_and_sources)
    visit webpage_path(webpage)
  end
end
