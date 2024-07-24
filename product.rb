# frozen_string_literal: true

require_relative 'constant'
# Single product based operation carried out here
class Product
  def initialize(product, quantity)
    @product = product
    @quantity = quantity
    @discount = 0
    @total_price = 0
  end

  def call
    return unless PRICE_LIST.keys.any?(product)

    details = {}
    details[:name] = product
    details[:quantity] = quantity
    details[:price] = calculate_price
    details[:saved] = calculate_saved(details[:price])

    details
  end

  def calculate_price
    if quantity == 1
      # return the regular price
      @total_price += PRICE_LIST[product]
    else
      remaining = quantity
      SALE_PRICE[product].reverse_each do |sale_quantity, sale_prices|
        next unless remaining >= sale_quantity

        mul = remaining / sale_quantity
        @total_price += (mul * sale_prices)
        remaining = remaining % sale_quantity
      end

      unless remaining.zero?
        @total_price += (PRICE_LIST[product] * remaining)
        remaining = 0
      end
    end
    @total_price.round(2)
  end

  def calculate_saved(total)
    ((PRICE_LIST[product] * quantity) - total).round(2)
  end

  private

  attr_reader :product, :quantity
end
