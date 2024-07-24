# frozen_string_literal: true

require_relative 'constant'
# This class for all kind of UIf
class Display
  def initialize(order_products)
    @order_products = order_products
  end

  def new_line
    puts
  end

  def add_dotted_line
    puts '-------------------------------'
  end

  def add_space(count)
    count.times { print ' ' }
  end

  def print_header
    HEADER.each do |x|
      print x
      add_space(ORDER_SPACE - x.length)
    end
    new_line
  end

  def print_products
    @order_products[:available].each do |product|
      print product[:name].to_s.capitalize
      add_space(ORDER_SPACE - product[:name].length)
      print product[:quantity].to_s
      add_space(ORDER_SPACE)
      print "#{CURRENCY}#{product[:price]}"
      new_line
    end
  end

  def print_summary
    print "Total price : #{CURRENCY}#{@order_products[:available].collect { |a| a[:price] }.reduce(:+).round(2)}"
    new_line
    print "You saved #{CURRENCY}#{@order_products[:available].collect { |a| a[:saved] }.reduce(:+).round(2)} today"
    new_line
  end

  def print_not_available
    return if @order_products[:not_available].empty?

    print "This are the Products are out of stock: #{@order_products[:not_available].join(',')}\n"
  end

  def print_available_products
    print "You may order from this Products: #{PRODUCTS.join(',')}\n"
  end

  def generate_receipt
    new_line
    new_line
    unless @order_products[:available].empty?
      print_header
      add_dotted_line
      print_products
      new_line
      new_line
      print_summary
      new_line
      new_line
    end
    add_dotted_line
    print_not_available
    add_dotted_line
    return unless @order_products[:available].empty?

    print_available_products
    add_dotted_line
  end
end
