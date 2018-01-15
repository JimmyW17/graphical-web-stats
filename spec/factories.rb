FactoryBot.define do
    factory :webpage do
        url "http://www.rubydoc.info/"
        protocol "http"
        resource "www.rubydoc.info"
        domain "rubydoc.info"
        # associations
        factory :webpage_with_page_histories do
            transient do
                page_histories_count 5
            end

            after(:create) do |webpage, evaluator|
                create_list(:page_history, evaluator.page_histories_count, webpage: webpage)
            end
        end
    end

    factory :page_history do
        # associations
        webpage
    end

    factory :page_source do
        html "<html><body><p>Hello there</p></body></html>"
    end

end