module Cashier
  class ProductRegistry
    PRODUCTS = [
      { product_code: "GR1", name: "Green Tea", price: 311, discount_code: "2x1" },
      { product_code: "SR1", name: "Strawberries", price: 500, discount_code: ">3" },
      { product_code: "CF1", name: "Coffee", price: 1123, discount_code: "3x2" }
    ]

    def self.find(product_code)
      product = PRODUCTS.find { |item| item[:product_code] == product_code }

      raise UnknownProduct, "Unknown product" unless product

      product
    end
  end
end
