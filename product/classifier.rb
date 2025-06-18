# frozen_string_literal: true

module Product
  class Classifier
    attr_reader :description

    CATEGORIES = {
      food: ["apple", "pizza", "burger", "milk", "chocolate"],
      book: ["novel", "book", "magazine"],
      medical: ["pills", "headache"]
    }.freeze

    def initialize(description:)
      @description = description
    end

    def call
      category = CATEGORIES.find { |category, keywords| keywords.any? { |keyword| description.downcase.include?(keyword) } }
      category = category&.first || :other

      imported = description.downcase.include?("imported")

      [category, imported]
    end
  end
end
