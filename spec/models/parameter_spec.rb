require 'rails_helper'

RSpec.describe Parameter, type: :model do
  describe 'Paramater' do
    it 'create' do
      paramater = build(:parameter)
      expect(paramater.pro_labore).to eq(1200.00)
      expect(paramater.worked_days_month).to eq(21)
      expect(paramater.hours_worked_day).to eq(6)
    end
  end
end
