require 'spec_helper'

describe Scrabble do
  subject { described_class.new }

  it 'sets up a basic dictionary' do
    expect(subject.dictionary.length).to eq(5)
    expect(subject.dictionary.all).to eq(['abc', 'abab', 'ccccc', 'z', 'abcd'])
  end

  it 'sets up a default algorithm' do
    expect(subject.algorithm).to be_a(Algorithm::Naive)
  end

  describe '#find_anagram' do
    it 'works' do
      expect(subject.find_anagram('cba')).to eq('abc - 3')
      expect(subject.find_anagram('zzzzz')).to eq('z - 1')
      expect(subject.find_anagram('abcccccd')).to eq('ccccc - 5')
    end
  end

  describe '#get_letters' do
    let(:text) { "2 aabbcc\n" }

    before do
      allow(subject).to receive(:gets).and_return(text)
    end

    it 'returns the user data following a space' do
      expect(subject).to receive(:gets).and_return(text)
      expect(subject.get_letters).to eq("aabbcc")
    end

    it 'can change the current algorithm' do
      expect(subject.algorithm).to be_a(Algorithm::Naive)
      subject.get_letters
      expect(subject.algorithm).to be_a(Algorithm::Prehash)
    end
  end
end
