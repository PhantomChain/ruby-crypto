require 'spec_helper'
require 'ostruct'

require 'btcruby'
require 'ark_crypto/crypto'
require 'ark_crypto/serialisers/vote'

describe ArkCrypto::Serialisers::Vote do
  describe '#serialise' do
    skip it 'should be ok' do
      transaction = JSON.parse!(File.read('spec/fixtures/transactions/vote.json'), object_class: OpenStruct)

      serialiser = ArkCrypto::Serialisers::Vote.new(transaction)

      actual = serialiser.serialise

      expect(actual).to eq(transaction[:serialized])
    end
  end
end
