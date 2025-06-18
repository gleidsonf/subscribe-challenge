# frozen_string_literal: true
 
RSpec.describe Input::Process do
  describe '.call' do
    subject { described_class.new(input:).call }

    context 'when the input is valid' do
      let(:input) do
        <<~INPUT
          2 book at 12.49
          1 music CD at 14.99
          1 chocolate bar at 0.85
        INPUT
      end

      it 'returns the products' do
        response = subject
        expect(response[:sale_taxes]).to eq(1.5)
        expect(response[:total]).to eq(42.32)

        expect(response[:products][0].description).to eq('book')
        expect(response[:products][0].quantity).to eq(2)
        expect(response[:products][0].amount).to eq(12.49)
        expect(response[:products][0].total_amount).to eq(24.98)
        expect(response[:products][0].total_amount_with_tax).to eq(24.98)
        expect(response[:products][0].tax).to eq(0.0)

        expect(response[:products][1].description).to eq('music CD')
        expect(response[:products][1].quantity).to eq(1)
        expect(response[:products][1].amount).to eq(14.99)
        expect(response[:products][1].total_amount).to eq(14.99)
        expect(response[:products][1].total_amount_with_tax).to eq(16.49)

        expect(response[:products][2].description).to eq('chocolate bar')
        expect(response[:products][2].quantity).to eq(1)
        expect(response[:products][2].amount).to eq(0.85)
        expect(response[:products][2].total_amount).to eq(0.85)
        expect(response[:products][2].total_amount_with_tax).to eq(0.85)
        expect(response[:products][2].tax).to eq(0.0)
      end
    end
  end
end