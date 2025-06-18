# frozen_string_literal: true

module Product
  module TaxCalculator
    IMPORTED_TAX_RATE = 0.05.freeze
    TAX_RATES = {
      book: 0.0,
      food: 0.0,
      medical: 0.0,
      other: 0.1
    }.freeze

    def self.calculate(category:, amount:, imported:)
      product_tax = calculate_base_tax(category:, amount:)
      imported_tax = calculate_imported_tax(amount:, imported:)

      total_tax = product_tax + imported_tax

      round_up(total_tax).round(2)
    end

    def self.calculate_base_tax(category:, amount:)
      base_tax = TAX_RATES[category] || 0.0

      amount * base_tax
    end

    def self.calculate_imported_tax(amount:, imported:)
      return 0.0 unless imported

      amount * IMPORTED_TAX_RATE
    end

    def self.round_up(value)
      # Round up to the nearest 0.05 by multiplying by 20 and then dividing by 20.0
      # e.g. rate 1.6875 ==> 1.6875 * 20 = 33.75 ==> 33.75.ceil = 34.0 ==> 34.0 / 20.0 = 1.7

      (value * 20).ceil / 20.0
    end
  end
end
