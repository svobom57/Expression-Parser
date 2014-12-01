require './spec/spec_helper'

describe Operator do

  describe UnaryMinus do
    it 'unary minus on int to SQL' do
      expect(UnaryMinus.new('180').to_sql).to be(-180)
    end

    it 'unary minus on string to SQL' do
      expect { UnaryMinus.new('ahoj').to_sql }.to raise_error(ArgumentError)
    end
  end

  describe Equal do
    it 'simple case' do
      expect(Equal.new('price', '180').to_sql).to eq '(price = 180)'
    end
  end

  describe And do
    it 'Nested case' do
      expression = And.new(Equal.new('price', UnaryMinus.new('180')), Equal.new('Group', 'Tabák'))
      expect(expression.to_sql).to eq '((price = -180) AND (Group = Tabák))'
    end
  end

end