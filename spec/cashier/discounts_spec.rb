module Cashier
  RSpec.describe Discounts do
    it "returns 0 when there is no products added" do
      empty_product_list = []

      expect(Discounts.total(empty_product_list)).to eq 0
    end

    it "returs the discount for the product list" do
      product_list = {
        { product_code: "SR1", name: "Strawberries", price: 500, discount_code: ">3" } => 3,
        { product_code: "CF1", name: "Coffee", price: 1123, discount_code: "3x2" } => 3
      }

      expect(Discounts.total(product_list)).to eq 1273
    end

    it "returs no discount for wrong discount products" do
      wrong_discount_product_list = {
        { product_code: "GR1", name: "Green Tea", price: 311, discount_code: "2x1" } => 1,
        { product_code: "CF1", name: "Coffee", price: 1123, discount_code: "www" } => 3,
        { product_code: "SR1", name: "Strawberries", price: 500, discount_code: ">3" } => 1
      }

      expect(Discounts.total(wrong_discount_product_list)).to eq 0
    end

    it "returs no discount for no discount products" do
      no_discount_product_list = {
        { product_code: "GR1", name: "Green Tea", price: 311, discount_code: "2x1" } => 1,
        { product_code: "CF1", name: "Coffee", price: 1123, discount_code: nil } => 3,
        { product_code: "SR1", name: "Strawberries", price: 500, discount_code: ">3" } => 1
      }

      expect(Discounts.total(no_discount_product_list)).to eq 0
    end
  end
end
