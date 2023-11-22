RSpec.describe Cashier::Cart do
  before(:each) do
    @cart = Cashier::Cart.new
  end

  it "returns 0 when there is no products added" do
    expect(@cart.total_price).to eq 0
  end

  it "returns 19,34 when 3 products are added" do
    @cart.add_product("GR1")
    @cart.add_product("SR1")
    @cart.add_product("CF1")

    expect(@cart.total_price).to eq 19.34
  end

  it "returs 3.11 when two GR1 are added" do
    @cart.add_product("GR1")
    @cart.add_product("GR1")

    expect(@cart.total_price).to eq 3.11
  end

  it "returs 16.61 when SR1, SR1, GR1 and SR1 are added" do
    @cart.add_product("SR1")
    @cart.add_product("SR1")
    @cart.add_product("GR1")
    @cart.add_product("SR1")

    expect(@cart.total_price).to eq 16.61
  end

  it "returs 30.57 when GR1, CF1, SR1, CF1 and CF1 are added" do
    @cart.add_product("GR1")
    @cart.add_product("CF1")
    @cart.add_product("SR1")
    @cart.add_product("CF1")
    @cart.add_product("CF1")

    expect(@cart.total_price).to eq 30.57
  end
end
