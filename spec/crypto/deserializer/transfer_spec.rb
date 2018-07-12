require 'spec_helper'

describe ArkEcosystem::Crypto::Deserializers::Transfer do
  describe '#deserialize' do
    it 'should be ok if signed with a passphrase' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/type-0/passphrase.json'), object_class: OpenStruct)

      actual = ArkEcosystem::Crypto::Deserializer.new(transaction['serialized']).deserialize

      expect(actual.version).to eq(1)
      expect(actual.network).to eq(30)
      expect(actual.type).to eq(transaction.data.type)
      expect(actual.timestamp).to eq(transaction.data.timestamp)
      expect(actual.sender_public_key).to eq(transaction.data.senderPublicKey)
      expect(actual.fee).to eq(transaction.data.fee)
      expect(actual.vendor_field_hex).to eq(transaction.data.vendorFieldHex)
      expect(actual.amount).to eq(transaction.data.amount)
      expect(actual.expiration).to eq(0)
      expect(actual.recipient_id).to eq(transaction.data.recipientId)
      expect(actual.signature).to eq(transaction.data.signature)
      expect(actual.vendor_field).to eq(transaction.data.vendorField)
      expect(actual.id).to eq(transaction.data.id)
    end

    it 'should be ok if signed with a second passphrase' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/type-0/second-passphrase.json'), object_class: OpenStruct)

      actual = ArkEcosystem::Crypto::Deserializer.new(transaction['serialized']).deserialize

      expect(actual.version).to eq(1)
      expect(actual.network).to eq(30)
      expect(actual.type).to eq(transaction.data.type)
      expect(actual.timestamp).to eq(transaction.data.timestamp)
      expect(actual.sender_public_key).to eq(transaction.data.senderPublicKey)
      expect(actual.fee).to eq(transaction.data.fee)
      expect(actual.vendor_field_hex).to eq(transaction.data.vendorFieldHex)
      expect(actual.amount).to eq(transaction.data.amount)
      expect(actual.expiration).to eq(0)
      expect(actual.recipient_id).to eq(transaction.data.recipientId)
      expect(actual.signature).to eq(transaction.data.signature)
      expect(actual.sign_signature).to eq(transaction.data.signSignature)
      expect(actual.vendor_field).to eq(transaction.data.vendorField)
      expect(actual.id).to eq(transaction.data.id)
    end
  end
end