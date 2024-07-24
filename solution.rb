# frozen_string_literal: true

require_relative 'product'
require_relative 'order'
require_relative 'display'

print "Please enter all the items purchased separated by a comma\n"
products = gets.chomp

if products.length.positive?
  order = Order.new(products.delete(" \t\r\n")).generate
  Display.new(order).generate_receipt
else
  print "You must enter atleast 1 product.\n"
end
