# frozen_string_literal: true

ORDER_SPACE = 10
HEADER = %w[Item Quantity Price].freeze
CURRENCY = '$'
PRODUCTS = %w[milk bread banana apple].freeze
PRICE_LIST = {
  'milk': 3.97,
  'bread': 2.17,
  'banana': 0.99,
  'apple': 0.89
}.freeze

SALE_PRICE = {
  milk: {
    2 => 5.00
  },
  bread: {
    3 => 6.00
  }
}.freeze
