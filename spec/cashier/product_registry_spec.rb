module Cashier
  RSpec.describe ProductRegistry do
    it "send an error message when a wrong product is added" do
      expect { ProductRegistry.find("WWW") }.to raise_error(UnknownProduct, "Unknown product")
    end

    it "returns a product with the given code" do
      gr1_product = { product_code: "GR1", name: "Green Tea", price: 311, discount_code: "2x1" }

      expect(ProductRegistry.find("GR1")).to eq(gr1_product)
    end
  end
end
