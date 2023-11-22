RSpec.describe Cashier::ProductRegistry do
  it "send an error message when a wrong product is added" do
    expect { Cashier::ProductRegistry.find("WWW") }.to raise_error(Cashier::UnknownProduct, "Unknown product")
  end
end
