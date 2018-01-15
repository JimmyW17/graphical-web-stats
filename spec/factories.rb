FactoryBot.define do
    factory :webpage do
        url "http://www.rubydoc.info/"
        protocol "http"
        resource "www.rubydoc.info"
        domain "rubydoc.info"
        # associations
        factory :webpage_with_page_histories_and_sources do
            transient do
                page_histories_count 3
            end
            after(:create) do |webpage, evaluator|
                create_list(:page_history_with_page_sources, evaluator.page_histories_count, webpage: webpage)
            end
        end
    end

    factory :page_history_with_page_sources, class: PageHistory do
        webpage
        after(:create) do |page_history|
            page_history.page_source = FactoryBot.create(:page_source)
        end
    end

    factory :page_source do
        html "<html><body><p>Hello there</p></body></html>"
    end

end