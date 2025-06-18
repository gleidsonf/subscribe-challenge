# frozen_string_literal: true

RSpec.describe Product::Classifier do
  describe '.classify' do
    subject { described_class.new(description:).call }

    context 'when the product is a book' do
      let(:description) { 'War and Peace book' }

      it { is_expected.to eq([:book, false]) }
    end

    context 'when the product is a chocolate bar' do
      let(:description) { 'chocolate bar' }

      it { is_expected.to eq([:food, false]) }
    end

    context 'when the product is a box of chocolates' do
      let(:description) { 'box of chocolates' }

      it { is_expected.to eq([:food, false]) }
    end

    context 'when the product is a packet of headache pills' do
      let(:description) { 'packet of headache pills' }

      it { is_expected.to eq([:medical, false]) }
    end

    context 'when the product is perfume' do
      let(:description) { 'bottle of perfume' }

      it { is_expected.to eq([:other, false]) }
    end

    context 'when the product is imported and a food' do
      let(:description) { 'imported box of chocolates' }

      it { is_expected.to eq([:food, true]) }
    end

    context 'when the product is imported and not recognized' do
      let(:description) { 'imported bottle of perfume' }

      it { is_expected.to eq([:other, true]) }
    end

    context 'when the product is not recognized' do
      let(:description) { 'random lightsaber' }

      it { is_expected.to eq([:other, false]) }
    end
  end
end
