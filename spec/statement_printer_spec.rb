# frozen_string_literal: true

require 'transaction'
require 'statement_printer'

describe StatementPrinter do
  answer = [
    'date || credit || debit || balance',
    '08/02/2021 || 5 ||  || 5',
    '09/02/2021 || 5 ||  || 10',
    '10/02/2021 ||  || 2 || 8'
  ]

  let(:printer) { described_class.new }
  let(:transaction1) { double(Transaction, date: '08/02/2021', credit: 5, debit: nil, balance: 5) }
  let(:transaction2) { double(Transaction, date: '09/02/2021', credit: 5, debit: nil, balance: 10) }
  let(:transaction3) { double(Transaction, date: '10/02/2021', credit: nil, debit: 2, balance: 8) }
  let(:transaction_list) { [transaction1, transaction2, transaction3] }
  let(:bank_statement) { double(BankStatement, transactions: transaction_list) }

  describe '#print_statement' do
      it 'prints off a statement in the correct format' do
        expect(printer.print_bank_statement(bank_statement)).to eq(answer)
      end
  end
end
