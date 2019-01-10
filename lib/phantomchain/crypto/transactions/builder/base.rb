require 'time'
require 'phantomchain/crypto/identities/private_key'
require 'phantomchain/crypto/configuration/fee'
require 'phantomchain/crypto/configuration/network'
require 'btcruby/base58'
require 'deep_hash_transform'

module PhantomChain
  module Crypto
    module Transactions
      module Builder
        # The base builder for transactions.
        class Base
          def initialize
            @transaction = PhantomChain::Crypto::Transactions::Transaction.new()
            @transaction.type = type
            @transaction.id = nil
            @transaction.fee = PhantomChain::Crypto::Configuration::Fee.get(@transaction.type)
            @transaction.sender_public_key = nil
            @transaction.recipient_id = nil
            @transaction.amount = 0
            @transaction.vendor_field = nil
            @transaction.timestamp = PhantomChain::Crypto::Utils::Slot.get_time
            @transaction.asset = {}
            @transaction.signature = nil
          end

          def sign(passphrase)
            sign_and_create_id(passphrase)
          end

          def sign_and_create_id(passphrase)
            @transaction.sign(passphrase)
            @transaction.id = @transaction.get_id
            self
          end

          def second_sign(second_passphrase)
            @transaction.second_sign(second_passphrase)
            @transaction.id = @transaction.get_id
            self
          end

          def verify
            @transaction.verify
          end

          def second_verify(second_public_key)
            @transaction.second_verify(second_public_key)
          end

          def to_params
            {
              type: @transaction.type,
              id: @transaction.id,
              fee: @transaction.fee,
              senderPublicKey: @transaction.sender_public_key,
              recipientId: @transaction.recipient_id,
              amount: @transaction.amount,
              vendorField: @transaction.vendor_field,
              timestamp: @transaction.timestamp,
              asset: @transaction.asset,
              signature: @transaction.signature
            }
          end

          def to_json
            to_params.to_json
          end

        end
      end
    end
  end
end
