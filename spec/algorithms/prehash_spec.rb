require 'spec_helper'

describe Algorithm::Prehash do
  subject { described_class.new(Dictionary.new(['a', 'abb', 'abc', 'abcd'])) }

  def find(letters)
    subject.find(Entry.new(letters))
  end

  describe 'correctness tests' do
    it 'finds exact matches' do
      expect(find('abb').word).to eq('abb')
    end

    it 'does not find impossible matches' do
      expect(find('b')).to eq(nil)
    end

    it 'finds subset matches' do
      expect(find('aabb').word).to eq('abb')
    end

    it 'finds the longest subset match' do
      expect(find('abbc').word).to eq('abc')
    end

    it 'works with multiple finds' do
      expect(find('abbc').word).to eq('abc')
      expect(find('abbcd').word).to eq('abcd')
    end
  end
end
