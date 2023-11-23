module Cashier
  require_relative "cashier/cart"
  require_relative "cashier/product_registry"
  require_relative "cashier/discounts"
  class UnknownProduct < StandardError; end
end
