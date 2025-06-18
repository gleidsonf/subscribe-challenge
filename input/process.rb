# frozen_string_literal: true

module Input
  class Process
    attr_reader :input
    def initialize(input:)
      @input = input
    end

    def call
      products = input.split("\n").map { |line| parse_product_line(line) }

      print_output(products)
      output(products)
    end

    private

    def parse_product_line(line)
      line_splitted = line.split(" ")
      quantity = line_splitted.shift.to_i
      amount = line_splitted.pop.to_f
      description = line_splitted[0...-1].join(" ")

      Product::Record.new(
        description:,
        quantity:,
        amount:
      )
    end

    def print_output(products)
      products.each do |product|
        puts "#{product.quantity} #{product.description}: #{product.total_amount_with_tax}"
      end

      puts "Sales Taxes: #{products.sum(&:tax).round(2)}"
      puts "Total: #{products.sum(&:total_amount_with_tax).round(2)}"
    end

    def output(products)
      {
        products: products,
        sale_taxes: products.sum(&:tax).round(2),
        total: products.sum(&:total_amount_with_tax).round(2)
      }
    end
  end
end
