class Cashier::Cart
  def initialize
    @product_list = []
    @product_registry = {
      "GR1" => { name: "Green Tea", price: 311, discount: "2x1" },
      "SR1" => { name: "Strawberries", price: 500, discount: "> 3" },
      "CF1" => { name: "Coffee", price: 1123, discount: "3x2" }
    }
  end

  def total_price
    (subtotal - discount) / 100.0
  end

  def subtotal
    @product_list.sum { |product| product[:price] }
  end

  def discount
    gr1_discount + sr1_discount + cf1_discount
  end

  def add_product(product)
    @product_list << @product_registry[product]
  end

  def gr1_discount
    number_of_products = @product_list.count { |product| product[:name] == "Green Tea" }
    (number_of_products / 2).floor * 311
  end

  def sr1_discount
    number_of_products = @product_list.count { |product| product[:name] == "Strawberries" }
    (number_of_products / 3).floor * (50 * 3)
  end

  def cf1_discount
    number_of_products = @product_list.count { |product| product[:name] == "Coffee" }
    (number_of_products / 3).floor * 1123
  end
end
