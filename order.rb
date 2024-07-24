# frozen_string_literal: true

require_relative 'constant'
# Order class to handle the whole order
class Order
  def initialize(raw_products)
    @raw_products = raw_products
    @summarization = {}
  end

  def generate
    @summarization[:available] = []
    @summarization[:not_available] = []
    product_list.each do |product, count|
      if PRODUCTS.include?(product)
        @summarization[:available] << Product.new(product.to_sym, count).call
      else
        @summarization[:not_available] << product
      end
    end

    @summarization
  end

  def product_list
    list = raw_products.split(',')

    list.tally # .with_indifferent_access
  end

  private

  attr_reader :raw_products
end
