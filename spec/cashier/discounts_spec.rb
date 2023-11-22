RSpec.describe Cashier::Discounts do
  let(:empty_product_list) { [] }
  let(:product_list) do
    {
      { product_code: "SR1", name: "Strawberries", price: 500, discount_type: ">3", per: 0, units: 3 } => 1,
      { product_code: "CF1", name: "Coffee", price: 1123, discount_type: "3x2", per: 3, units: 0 } => 3
    }
  end

  let(:no_discount_product_list) do
    {
      { product_code: "GR1", name: "Green Tea", price: 311, discount_type: "2x1", per: 2, units: 0 } => 1,
      { product_code: "CF1", name: "Coffee", price: 1123, discount_type: nil, per: 0, units: 0 } => 3,
      { product_code: "SR1", name: "Strawberries", price: 500, discount_type: ">3", per: 0, units: 3 } => 1
    }
  end

  it "returns 0 when there is no products added" do
    expect(Cashier::Discounts.total(empty_product_list)).to eq 0
  end

  it "returs the discount for the product list" do
    expect(Cashier::Discounts.total(product_list)).to eq 1123
  end

  it "returs no discount for no discount products" do
    expect(Cashier::Discounts.total(no_discount_product_list)).to eq 0
  end
end
