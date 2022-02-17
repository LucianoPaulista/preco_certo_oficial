FactoryBot.define do
  factory :markup_item do
    description { "Lucro" }
    percentage { 10.00 }
    association :markup
  end

  def markup_with_items(items_count: 10)
    FactoryBot.create(:markup) do |markup|
      FactoryBot.create_list(:markup_item, items_count, markup: markup)
    end
  end
end
