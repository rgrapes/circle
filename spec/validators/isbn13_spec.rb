require 'rails_helper'

RSpec.describe Utils::Isbn13 do
  describe '.valid?' do
    it 'returns true for a valid ISBN-13' do
      expect(described_class.valid?('9780470059029')).to be true
      expect(described_class.valid?('1234567890128')).to be true
      expect(described_class.valid?('9780143007234')).to be true
      978014300723
    end

    it 'returns false for an invalid ISBN-13' do
      expect(described_class.valid?('9780470059028')).to be false
      expect(described_class.valid?('1234567890123')).to be false
      expect(described_class.valid?('9780143007230')).to be false
    end
  end

  describe '.calculate_check_digit' do
    it 'calculates the correct ISBN-13 check digit' do
      expect(described_class.calculate_check_digit('978047005902')).to eq('9')
      expect(described_class.calculate_check_digit('123456789012')).to eq('8')
      expect(described_class.calculate_check_digit('978014300723')).to eq('4')
    end

    it 'raises an error for invalid input length' do
      expect { described_class.calculate_check_digit('12345') }.to raise_error(ArgumentError, /Invalid ISBN length/)
    end
  end
end
