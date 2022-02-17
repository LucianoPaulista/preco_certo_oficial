require 'rails_helper'

RSpec.describe Markup, type: :model do
  describe 'Markup' do
    it 'create' do
      markup = build(:markup)
      expect(markup.description).to eq('Venda pelo mercado livre')
    end
  end
end
