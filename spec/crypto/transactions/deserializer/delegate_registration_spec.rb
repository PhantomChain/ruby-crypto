describe PhantomChain::Crypto::Transactions::Deserializers::DelegateRegistration do
  describe '#deserialize' do
    it 'should be ok if signed with a passphrase' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/delegate_registration/passphrase.json'), object_class: OpenStruct)

      actual = PhantomChain::Crypto::Transactions::Deserializer.new(transaction['serialized']).deserialize

      expect(actual.version).to eq(1)
      expect(actual.network).to eq(30)
      expect(actual.type).to eq(transaction.data.type)
      expect(actual.timestamp).to eq(transaction.data.timestamp)
      expect(actual.sender_public_key).to eq(transaction.data.senderPublicKey)
      expect(actual.fee).to eq(transaction.data.fee)
      expect(actual.signature).to eq(transaction.data.signature)
      expect(actual.amount).to eq(transaction.data.amount)
      expect(actual.id).to eq(transaction.data.id)
      expect(actual.asset[:delegate][:username]).to eq(transaction.data.asset.delegate.username)
      expect(actual.verify).to eq(true)
    end

    it 'should be ok if signed with a second passphrase' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/delegate_registration/second-passphrase.json'), object_class: OpenStruct)

      actual = PhantomChain::Crypto::Transactions::Deserializer.new(transaction['serialized']).deserialize

      expect(actual.version).to eq(1)
      expect(actual.network).to eq(30)
      expect(actual.type).to eq(transaction.data.type)
      expect(actual.timestamp).to eq(transaction.data.timestamp)
      expect(actual.sender_public_key).to eq(transaction.data.senderPublicKey)
      expect(actual.fee).to eq(transaction.data.fee)
      expect(actual.signature).to eq(transaction.data.signature)
      expect(actual.sign_signature).to eq(transaction.data.signSignature)
      expect(actual.amount).to eq(transaction.data.amount)
      expect(actual.id).to eq(transaction.data.id)
      expect(actual.asset[:delegate][:username]).to eq(transaction.data.asset.delegate.username)
      expect(actual.verify).to eq(true)
    end
  end
end
