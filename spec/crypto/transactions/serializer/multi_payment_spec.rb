describe PhantomChain::Crypto::Transactions::Serializers::MultiPayment do
  describe '#serialize' do
    skip 'should be ok' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/multi_payment/passphrase.json'), object_class: OpenStruct)

      PhantomChain::Crypto::Configuration::Network.set(PhantomChain::Crypto::Networks::Devnet)

      actual = PhantomChain::Crypto::Transactions::Serializer.new(transaction.data).serialize

      expect(actual).to eq(transaction.serialized)
    end
  end
end
