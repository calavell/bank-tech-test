# frozen_string_literal: true

require 'statement_printer'

describe StatementPrinter do
  transactions = [
    { date: '08/02/2021', amount: 5, balance: 5 },
    { date: '09/02/2021', amount: 5, balance: 10 },
    { date: '10/02/2021', amount: -2, balance: 8 }
  ]

  answer = [
    'date || credit || debit || balance',
    '08/02/2021 || 5 ||  || 5',
    '09/02/2021 || 5 ||  || 10',
    '10/02/2021 || || 2 || 8'
  ]

  let(:printer) { described_class.new }

  describe '#print_statement' do
    context 'when there are transactions on the account' do
      let(:bank_statement) { double(BankStatement, transactions: transactions) }
      let(:bank_account) { double(BankAccount.new, statement: bank_statement, no_transactions?: false) }
      it 'prints off a statement in the correct format' do
        expect(printer.print_statement(bank_account)).to eq(answer)
      end
    end

    context 'when there are no transactions on the account' do
      let(:empty_bank_statement) { double(BankStatement) }
      let(:empty_bank_account) { double(BankAccount.new, statement: empty_bank_statement, no_transactions?: true) }
      it 'prints riases an error if there are no transactions in the account' do
        expect { printer.print_statement(empty_bank_account) }.to raise_error('There is no statement for this account')
      end
    end
  end
end
