RSpec.describe Cashier::Cart do
  it "returns 0 when there is no products added" do
    cart = Cashier::Cart.new

    expect(cart.total_price).to eq(0)
  end

  it "returns 50.29" do
    cart = Cashier::Cart.new

    cart.add_product(3.11)  # "GR1"
    cart.add_product(16.61) # "SR1"
    cart.add_product(30.57) # "CF1"

    expect(cart.total_price).to eq(50.29)
  end
end
