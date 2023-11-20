RSpec.describe Cashier::Cart do
  it "returns 0 when there is no products added" do
    cart = Cashier::Cart.new

    expect(cart.total_price).to eq(0)
  end

  it "returns 19,34 when 3 products are added" do
    cart = Cashier::Cart.new

    cart.add_product("GR1")
    cart.add_product("SR1")
    cart.add_product("CF1")

    expect(cart.total_price).to eq(19.34)
  end
end
