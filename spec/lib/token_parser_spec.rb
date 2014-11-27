require './spec/spec_helper'

describe 'Simple parsing' do
  let(:parser) { TokenParser.new }

  def returns(string, tokens)
    expect(parser.parse(string)).to eq tokens
  end

  it 'empty input' do
    returns '', []
  end

  it 'single token' do
    returns 'attribute', %w(attribute)
  end

  it 'simple assertions' do
    returns 'weight > 0', %w(weight > 0)
  end

  it 'simple OR operator' do
    returns '    true     || false', %w(true || false)
  end

  it 'simple AND operator' do
    returns 'true && false', %w(true && false)
  end

end