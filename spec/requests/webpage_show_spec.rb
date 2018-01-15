require 'rails_helper'

RSpec.describe "WebpageShow", type: :request do
  it "shows webpage attributes on show view" do
    webpage = create(
      :webpage_with_page_histories_and_sources, 
      url: "https://github.com/",
      protocol: "https",
      resource: "github.com",
      domain: "github.com"
      )
    visit webpage_path(webpage)
    expect(page).to have_content(webpage.resource)
    expect(page).to have_content(webpage.protocol)
  end
end
