class Cashier::Discounts
  class << self
    def total(product_list)
      product_list.sum do |product, quantity|
        case product[:discount_type]
        when "2x1"
          one_free(quantity: quantity, per: product[:per], price: product[:price])
        when "3x2"
          one_free(quantity: quantity, per: product[:per], price: product[:price])
        when ">3"
          discount_from(quantity: quantity, units: product[:units])
        else
          0
        end
      end
    end

    private

    def discount_from(quantity:, units:)
      price = 50 * units

      (quantity / units).floor * price
    end

    def one_free(quantity:, per:, price:)
      (quantity / per).floor * price
    end
  end
end
