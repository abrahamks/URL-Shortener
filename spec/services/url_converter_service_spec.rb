require 'rails_helper'

RSpec.describe UrlConverterService do
  before :each do
    allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development'))
  end

  describe '#convert_int_to_alphabet' do
    context 'id = 0' do
      let(:id) { 0 }
      it { expect(UrlConverterService.convert_int_to_alphabet(id)).to eq('z') }
    end

    context 'id = 14569020' do
      let(:id) { 14569020 }
      it { expect(UrlConverterService.convert_int_to_alphabet(id)).to eq('oTkF') }
    end
  end

  describe '#convert_alphabet_to_int' do
    context 'alphabet = z' do
      let(:alphabet) { 'z' }
      it { expect(UrlConverterService.convert_alphabet_to_int(alphabet)).to eq(0) }
    end

    context 'alphabet = oTkF' do
      let(:alphabet) { 'oTkF' }
      let(:url_converter_service) { UrlConverterService.new }
      it { expect(UrlConverterService.convert_alphabet_to_int(alphabet)).to eq(14569020) }
    end
  end
end
