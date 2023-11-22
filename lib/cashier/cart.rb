class Cashier::Cart
  def initialize
    @product_list = Hash.new(0)
  end

  def total_price
    (subtotal - Cashier::Discounts.total(@product_list)) / 100.0
  end

  def add_product(product_code)
    @product_list[Cashier::ProductRegistry.find(product_code)] += 1
  end

  private

  def subtotal
    @product_list.sum { |product, quantity| product[:price] * quantity }
  end
end
