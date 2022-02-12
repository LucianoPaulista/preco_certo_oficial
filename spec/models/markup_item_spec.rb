require 'rails_helper'

RSpec.describe MarkupItem, type: :model do
  describe 'Markup Item' do
    it 'create' do
      markup_item = build(:markup_item)
      expect(markup_item.description).to eq('Lucro')
      expect(markup_item.percentage).to eq(10.00)
    end
  end
end
