# frozen_string_literal: true

RSpec.describe Product::Record do
  describe '#tax' do
    let(:quantity) { 1 }
    let(:amount) { 10.00 }
    let(:description) { 'War and Peace book' }

    subject { described_class.new(description: description, quantity: quantity, amount: amount) }

    context 'when the product is a book' do
    let(:description) { 'War and Peace book' }

      it 'returns the tax' do
        expect(subject.tax).to eq(0.0)
      end

      it 'returns the total amount for the product' do
        expect(subject.total_amount).to eq(10.0)
      end

      it 'returns the total amount with tax for the product' do
        expect(subject.total_amount_with_tax).to eq(10.0)
      end

      it 'returns the imported flag' do
        expect(subject.imported).to be(false)
      end
    end

    context 'when the product is a food' do
      let(:quantity) { 2 }
      let(:description) { 'Peperoni pizza' }

      it 'returns the tax' do
        expect(subject.tax).to eq(0.0)
      end

      it 'returns the total amount for the product' do
        expect(subject.total_amount).to eq(20.0)
      end

      it 'returns the total amount with tax for the product' do
        expect(subject.total_amount_with_tax).to eq(20.0)
      end
    end

    context 'when the product is a medical product' do
      let(:amount) { 9.75 }
      let(:description) { 'Headache pills' }

      it 'returns the tax' do
        expect(subject.tax).to eq(0.0)
      end

      it 'returns the total amount for the product' do
        expect(subject.total_amount).to eq(9.75)
      end

      it 'returns the total amount with tax for the product' do
        expect(subject.total_amount_with_tax).to eq(9.75)
      end
    end

    context 'when the product is taxable' do
      let(:description) { 'Music CD' }
      let(:amount) { 14.99 }

      it 'returns the tax' do
        expect(subject.tax).to eq(1.5)
      end

      it 'returns the total amount for the product' do
        expect(subject.total_amount).to eq(14.99)
      end

      it 'returns the total amount with tax for the product' do
        expect(subject.total_amount_with_tax).to eq(16.49)
      end
    end

    context 'when the product is imported' do
      let(:description) { 'Imported box of chocolates' }
      let(:quantity) { 3 }
      let(:amount) { 11.25 }

      it 'returns the tax' do
        expect(subject.tax).to eq(1.7)
      end

      it 'returns the total amount for the product' do
        expect(subject.total_amount).to eq(33.75)
      end

      it 'returns the total amount with tax for the product' do
        expect(subject.total_amount_with_tax).to eq(35.45)
      end

      it 'returns the imported flag' do
        expect(subject.imported).to be(true)
      end
    end
  end
end
