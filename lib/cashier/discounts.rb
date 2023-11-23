module Cashier
  class Discounts
    DISCOUNTS = {
      "2x1" => { name: :one_free, per: 2, units: 0, reduction_cnts: 0 },
      ">3" => { name: :discount_from, per: 0, units: 3, reduction_cnts: 50 },
      "3x2" => { name: :one_free, per: 3, units: 0, reduction_cnts: 0 }
    }

    DISCOUNTS.default = {}

    class << self
      def total(product_list)
        product_list.sum do |product, quantity|
          discount = DISCOUNTS[product[:discount_code]]

          case discount[:name]
          when :one_free
            one_free(quantity: quantity, price: product[:price], per: discount[:per])
          when :discount_from
            discount_from(quantity: quantity, units: discount[:units], reduction_cnts: discount[:reduction_cnts])
          else 0
          end
        end
      end

      private

      def one_free(quantity:, per:, price:)
        (quantity / per).floor * price
      end

      def discount_from(quantity:, units:, reduction_cnts:)
        price = reduction_cnts * units

        (quantity / units).floor * price
      end
    end
  end
end
