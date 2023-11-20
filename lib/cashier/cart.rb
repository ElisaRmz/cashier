class Cashier::Cart
  attr_accessor :product_list

  def initialize
    @product_list = []
  end

  def total_price
    @product_list.sum
  end

  def add_product(product)
    @product_list << product
  end
end
