require 'rails_helper'

RSpec.describe RawMaterial, type: :model do

  describe 'raw material' do
    it 'create' do
      raw_material = build(:raw_material)
      expect(raw_material.description).to  eq('Bagun Branco')
      expect(raw_material.unity).to eq('ML')
      expect(raw_material.price).to eq(18.00)
    end
  end
end
