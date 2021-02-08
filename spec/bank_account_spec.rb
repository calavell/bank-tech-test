require 'bank_account'

describe BankAccount do
  let(:bank_account) { described_class.new }
  
  describe '#adjust_balance' do
    it 'will call the update_statement method' do
      expect(bank_account).to receive(:update_statement).with(10)
      bank_account.adjust_balance(10)
    end

    context 'crediting your account' do
      it 'will update the balance by the inputted positive number' do
        bank_account.adjust_balance(10)
        expect(bank_account.current_balance).to eq 10
      end

      it 'will update the balance by the inputted positive number' do
        bank_account.adjust_balance(1)
        expect(bank_account.current_balance).to eq 1
      end
    end

    context 'debiting your account' do
      it 'will error if you try to withdraw when balance is zero' do
        expect { bank_account.adjust_balance(-1) }.to raise_error('Insufficient funds')
      end

      it 'will error if you try to withdraw more than current balance' do
        bank_account.adjust_balance(1)
        expect { bank_account.adjust_balance(-2) }.to raise_error('Insufficient funds')
      end

      it 'will allow you to withdraw as long as you do not go below zero' do
        bank_account.adjust_balance(10)
        bank_account.adjust_balance(-5)
        expect(bank_account.current_balance).to eq 5
      end

      it 'will allow you to empty your account' do
        bank_account.adjust_balance(10)
        bank_account.adjust_balance(-10)
        expect(bank_account.current_balance).to eq 0
      end
    end
  end
end
