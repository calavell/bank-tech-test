# frozen_string_literal: true

require 'transaction'
require 'statement_printer'
# let(:bank_statement) { double(BankStatement, transactions: transactions, no_transactions?: false) }
describe StatementPrinter do
  answer = [
    'date || credit || debit || balance',
    '08/02/2021 || 5 ||  || 5',
    '09/02/2021 || 5 ||  || 10',
    '10/02/2021 || || 2 || 8'
  ]

  let(:printer) { described_class.new }

  describe '#print_statement' do
    context 'when there are transactions on the account' do
      let(:transaction1) { double(Transaction, date: '08/02/2021', amount: 5, balance: 5) }
      let(:transaction2) { double(Transaction, date: '09/02/2021', amount: 5, balance: 10) }
      let(:transaction3) { double(Transaction, date: '10/02/2021', amount: -2, balance: 8) }
      let(:transaction_list) { [transaction1, transaction2, transaction3] }
      let(:bank_statement) { double(BankStatement, transactions: transaction_list, no_transactions?: false) }
      it 'prints off a statement in the correct format' do
        expect(printer.print_bank_statement(bank_statement)).to eq(answer)
      end
    end

    context 'when there are no transactions on the account' do
      let(:empty_bank_statement) { double(BankStatement, no_transactions?: true) }
      it 'prints riases an error if there are no transactions in the account' do
        expect { printer.print_bank_statement(empty_bank_statement) }.to raise_error('There is no statement for this account')
      end
    end
  end
end
