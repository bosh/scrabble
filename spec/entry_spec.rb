require 'spec_helper'

describe Entry do
  subject { described_class.new('foobar') }

  it 'transforms the initial word into other data' do
    expect(subject.word).to eq('foobar')
    expect(subject.lexicographic).to eq('abfoor')
    expect(subject.length).to eq(6)
  end
end
