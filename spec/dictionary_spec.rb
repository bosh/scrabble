require 'spec_helper'

describe Dictionary do
  subject { described_class.new }

  it 'sets up a default wordlist' do
    expect(subject.length).to eq(5)
    expect(subject.all).to eq(['abc', 'abab', 'ccccc', 'z', 'abcd'])
  end

  describe '#all_by_length' do
    it 'sorts entries by length' do
      expect(subject.all_by_length.map(&:word)).to eq(['ccccc', 'abab', 'abcd', 'abc', 'z'])
    end
  end
end