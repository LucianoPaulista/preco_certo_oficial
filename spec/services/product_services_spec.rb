require 'rails_helper'

RSpec.describe ProductServices, type: :model do
  describe 'Fixed Expense' do
    let(:product) { create(:product, description: "Bolsa Farmacinha 19 x 25", unity: 'PÇ', production_time:  1.6) }
    let(:raw_material)  { create(:raw_material, description: "Bagun Branco", unity: "ML", price: '18.00') }
    let(:product_item) { create_list(:product_item, 10, component: 'Peça 1', consumption: 0.0100, raw_material_id: raw_material.id, product_id: product.id) }
    let(:fixed_expense) { create_list(:fixed_expense, 10, description: "Energia", value: 100.00) }
    let(:parameter) { create(:parameter) }

    let(:markup) { create(:markup, description: "Venda pelo Mercado Livre") }
    let(:markup_item)  { create_list(:markup_item, 10, description: "Frete", percentage: 8.00, markup_id: markup.id) }

    it 'calcular custo materia-prima no valor de R$ 18.00' do
      raw_material = { product_item: product_item }
      result = ProductServices.new(raw_material).calculate_cust_raw_material
      expect(result).to eq(1.8)
    end

    it 'calcular produção dia com tempo de produção de 1,6 e passando parâmetros' do
      products = { product: product, parameter: parameter}
      result = ProductServices.new(products ).calculate_production_day
      expect(result).to eq(225.00)
    end

    it 'calcular produção mês' do
      products = { product: product, parameter: parameter}
      result = ProductServices.new(products ).calculate_production_month
      expect(result).to eq(4725)
    end

    it 'calcular custo de mão-de-obra do produto' do
      products = { product: product, parameter: parameter}
      result = ProductServices.new(products ).calculate_man_power
      expect(result).to eq(0.2540)
    end

    it 'calcular despesa do produto' do
      products = { product: product, parameter: parameter, fixed_expense: fixed_expense }
      result = ProductServices.new(products ).calculate_fixed_expense_product
      expect(result).to eq(0.2116)
    end

    it 'calcular custo do produto' do
      products =   { product: product, product_item: product_item, markup_item: markup_item,  parameter: parameter, fixed_expense: fixed_expense }
      result = ProductServices.new(products).calculate_price_product
      expect(result).to eq(11.33)
    end

  end
end
