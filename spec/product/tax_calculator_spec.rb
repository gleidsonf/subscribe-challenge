# frozen_string_literal: true

RSpec.describe Product::TaxCalculator do
  describe '.calculate' do
    let(:category) { :book }
    let(:amount) { 10.00 }
    let(:imported) { false }

    subject do
      described_class.calculate(category: category, amount: amount, imported: imported)
    end

    context 'when the category is a book' do
      let(:category) { :book }

      it 'returns 0.0 tax for the category' do
        expect(subject).to eq(0.0)
      end
    end

    context 'when the category is a food' do
      let(:category) { :food }

      it 'returns 0.0 tax for the category' do
        expect(subject).to eq(0.0)
      end
    end

    context 'when the category is a medical product' do
      let(:category) { :medical }

      it 'returns 0.0 tax for the category' do
        expect(subject).to eq(0.0)
      end
    end

    context 'when the category is other' do
      let(:category) { :other }

      it 'returns 1.0 tax for the category' do
        expect(subject).to eq(1.0)
      end
    end

    context 'when the category is other and imported' do
      let(:amount) { 22.00 }
      let(:category) { :other }
      let(:imported) { true }

      it 'returns the applied tax for the category' do
        expect(subject).to eq(3.3)
      end
    end
  end
end
