# frozen_string_literal: true

require 'bank_statement'
describe BankStatement do
  let(:bank_statement) { described_class.new }

  describe '#add_transaction' do
    date = '01/01/2021'
    it 'adds a transaction to the statement for a credit' do
      expect { bank_statement.add_transaction(date, 5, 5) }.to change { bank_statement.statement_length }.from(0).to(1)
    end

    it 'adds a transaction to the statement for a debit' do
      expect { bank_statement.add_transaction(date, -5, 5) }.to change { bank_statement.statement_length }.from(0).to(1)
    end

    it 'adds a transaction to the statement for a debit if it empties the account' do
      bank_statement.add_transaction(date, 5, 5)
      expect { bank_statement.add_transaction(date, -5, 0) }.to change { bank_statement.statement_length }.from(1).to(2)
    end
  end
end
