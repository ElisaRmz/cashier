class Cashier::Cart
  attr_accessor :product_list, :product_registry

  def initialize
    @product_list = []
    @product_registry = {
      "GR1" => { name: "Green Tea", price: 3.11 },
      "SR1" => { name: "Strawberries", price: 5.00 },
      "CF1" => { name: "Coffee", price: 11.23 }
    }
  end

  def total_price
    @product_list.sum { |product| product[:price] }
  end

  def add_product(product)
    @product_list << product_registry[product]
  end
end
