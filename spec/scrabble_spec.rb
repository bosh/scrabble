require 'spec_helper'

describe Scrabble do
  subject { described_class.new }

  it 'sets up a basic dictionary' do
    expect(subject.dictionary.length).to eq(5)
    expect(subject.dictionary.all).to eq(['abc', 'abab', 'ccccc', 'z', 'abcd'])
  end

  it 'works' do
    expect(subject.find_anagram('cba')).to eq('abc')
    expect(subject.find_anagram('zzzzz')).to eq('z')
    expect(subject.find_anagram('abcccccd')).to eq('ccccc')
  end
end