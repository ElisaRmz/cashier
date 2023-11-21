# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

module Cashier
  class UnknownProduct < StandardError; end
  # Your code goes here...
  #
end
