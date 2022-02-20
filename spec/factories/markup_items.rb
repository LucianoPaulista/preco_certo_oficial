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
  <<-DOC
  let(:markup_itens) do [
    create(:markup_item, description: 'Lucro', percentage: 10.00)
    create(:markup_item, description: 'Comissão', percentage: 8.00)
    create(:markup_item, description: 'Frete', percentage: 3.00)
  ]
  end

  hash_arr_mkp_sp = [
    { "description" => 'Lucro', "percentage" => 10.00 },
    { "description" => 'Comissao', "percentage" => 8.00 },
    { "description" => 'Frete', "percentage" => 3.00 }
  ]

  hash_arr_mkp_sp.each do |hash|
    hash.each do |key,value|
      puts (key.to_s + ': ' + value.to_s)
    end
  end

  after(:create) do |markup_item, hash_arr_mkp_sp|
    user.name.upcase! if evaluator.upcased
  end





  trait :markup_sp do

  end

DOC






end
