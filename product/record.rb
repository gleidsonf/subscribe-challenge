# frozen_string_literal: true

module Product
  class Record
    def initialize(
      description:,
      quantity:,
      amount:,
      classifier: Product::Classifier,
      tax_calculator: Product::TaxCalculator
    )
      @classifier = classifier
      @tax_calculator = tax_calculator

      category, imported = @classifier.new(description:).call

      @description = description
      @quantity = quantity
      @amount = amount.to_f
      @imported = imported
      @category = category
    end

    def tax
      @tax ||= @tax_calculator.calculate(
        category: category,
        amount: total_amount,
        imported: imported
      )
    end

    def total_amount
      quantity * amount
    end

    def total_amount_with_tax
      (total_amount + tax).round(2)
    end

    attr_reader :description, :quantity, :amount, :imported, :category
  end
end
