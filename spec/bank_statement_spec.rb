# frozen_string_literal: true

require 'bank_statement'
describe BankStatement do
  let(:bank_statement) { described_class.new }
  let(:date) { '01/01/2021' }

  describe '#add_transaction' do
    it 'adds a transaction to the statement for a credit' do
      expect { bank_statement.add_transaction(date: date, credit: 5, debit: nil, balance: 5) }.to change { bank_statement.statement_length }.from(0).to(1)
    end

    it 'adds a transaction to the statement for a debit' do
      expect { bank_statement.add_transaction(date: date, credit: nil, debit: 5, balance: 5) }.to change { bank_statement.statement_length }.from(0).to(1)
    end

    it 'adds a transaction to the statement for a debit if it empties the account' do
      bank_statement.add_transaction(date: date, credit: 5, debit: nil, balance: 5)
      expect { bank_statement.add_transaction(date: date, credit: nil, debit: 5, balance: 0) }.to change { bank_statement.statement_length }.from(1).to(2)
    end
  end

  describe '#no_transactions?' do
    it 'returns true if there are no transactions logged to the statement' do
      expect(bank_statement.no_transactions?).to eq true
    end

    it 'returns false if there is at least one transactions logged to the statement' do
      bank_statement.add_transaction(date: date, credit: 5, debit: nil, balance: 0)
      expect(bank_statement.no_transactions?).to eq false
    end
  end
end
