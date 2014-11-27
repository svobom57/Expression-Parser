require './spec/spec_helper'

describe 'Simple parsing' do
  let(:parser) { TokenParser.new }

  it 'empty input' do
    parsed = parser.parse('')

    expect(parsed).to be_empty
    expect(parsed.length).to eq 0
  end
end