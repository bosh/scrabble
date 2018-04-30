require 'spec_helper'

describe Algorithm::Naive do
  subject { described_class.new(Dictionary.new(['a', 'abb', 'abc', 'abcd'])) }

  it 'works' do
    expect(subject.find('a').word).to eq('a')
    expect(subject.find('b')).to eq(nil)
    expect(subject.find('aabb').word).to eq('abb')
    expect(subject.find('aabc').word).to eq('abc')
  end
end
