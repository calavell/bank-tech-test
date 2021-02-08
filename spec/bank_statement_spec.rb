require 'bank_statement'
describe BankStatement do
    let(:bank_statement) { described_class.new }

  describe '#add_transaction' do
    it 'adds a transaction to the statement for a credit' do
      expect { bank_statement.add_transaction('01/01/2021', 20, 20) }.to change { bank_statement.statement_length }.from(0).to(1)
    end

    it 'adds a transaction to the statement for a debit' do
      expect { bank_statement.add_transaction('01/01/2021', -20, 20) }.to change { bank_statement.statement_length }.from(0).to(1)
    end

    it 'adds a transaction to the statement for a debit if it empties the account' do
      expect { bank_statement.add_transaction('01/01/2021', -20, 0) }.to change { bank_statement.statement_length }.from(0).to(1)
    end
  end
end
