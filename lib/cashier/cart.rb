module Cashier
  class Cart
    def initialize
      @product_list = Hash.new(0)
    end

    def total_price
      (subtotal - Discounts.total(@product_list)) / 100.0
    end

    def add_product(product_code)
      @product_list[ProductRegistry.find(product_code)] += 1
    end

    def clean
      @product_list = Hash.new(0)
    end

    private

    def subtotal
      @product_list.sum { |product, quantity| product[:price] * quantity }
    end
  end
end
