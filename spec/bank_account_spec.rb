# frozen_string_literal: true

require 'bank_account'
require 'statement_printer'

describe BankAccount do
  let(:bank_account) { described_class.new }

  describe '#print_statement' do
    it 'calls the print_bank_statement method' do
      expect(bank_account.printer).to receive(:print_bank_statement).with(bank_account.statement)
      bank_account.print_statement
    end
  end

  describe '#credit_account' do
    it 'will call the update_statement method' do
      expect(bank_account).to receive(:update_statement).with(credit: 10, debit: nil)
      bank_account.credit_account(10)
    end

    it 'will increase the balance by the inputted number' do
      bank_account.credit_account(10)
      expect(bank_account.current_balance).to eq 10
    end

    it 'will keep track of balance for multiple credits' do
      bank_account.credit_account(1)
      bank_account.credit_account(10)
      expect(bank_account.current_balance).to eq 11
    end
  end

  describe '#debit_account' do
    it 'will call the update_statement method as long as there are enough funds' do
      bank_account.credit_account(10)
      expect(bank_account).to receive(:update_statement).with(credit: nil, debit: 10)
      bank_account.debit_account(10)
    end
    it 'will error if you try to withdraw when balance is zero' do
      expect { bank_account.debit_account(1) }.to raise_error('Insufficient funds')
    end

    it 'will error if you try to withdraw more than current balance' do
      bank_account.credit_account(1)
      expect { bank_account.debit_account(2) }.to raise_error('Insufficient funds')
    end

    it 'will allow you to withdraw as long as you do not go below zero' do
      bank_account.credit_account(10)
      bank_account.debit_account(5)
      expect(bank_account.current_balance).to eq 5
    end

    it 'will allow you to empty your account' do
      bank_account.credit_account(10)
      bank_account.debit_account(10)
      expect(bank_account.current_balance).to eq 0
    end
  end
end
