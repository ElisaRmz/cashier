class Cashier::ProductRegistry
  PRODUCTS = [
    { product_code: "GR1", name: "Green Tea", price: 311, discount_type: "2x1", per: 2, units: 0 },
    { product_code: "SR1", name: "Strawberries", price: 500, discount_type: ">3", per: 0, units: 3 },
    { product_code: "CF1", name: "Coffee", price: 1123, discount_type: "3x2", per: 3, units: 0 }
  ]

  def self.find(product_code)
    product = PRODUCTS.find { |item| item[:product_code] == product_code }

    raise Cashier::UnknownProduct, "Unknown product" unless product

    product
  end
end
