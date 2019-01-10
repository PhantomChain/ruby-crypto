require 'phantomchain/crypto/enums/fees'
require 'phantomchain/crypto/enums/types'
require 'phantomchain/crypto/transactions/builder/base'

module PhantomChain
  module Crypto
    module Transactions
      module Builder
        # The builder for multi signature registration transactions.
        class MultiSignatureRegistration < Base
          def initialize
            super

            @transaction.asset = {
              multisignature: {}
            }
          end

          def set_keysgroup(keysgroup)
            @fee = (keysgroup.size + 1) * PhantomChain::Crypto::Configuration::Fee.get(@transaction.type)

            @transaction.asset[:multisignature][:keysgroup] = keysgroup
            self
          end

          def set_lifetime(lifetime)
            @transaction.asset[:multisignature][:lifetime] = lifetime
            self
          end

          def set_min(min)
            @transaction.asset[:multisignature][:min] = min
            self
          end

          def type
            PhantomChain::Crypto::Enums::Types::MULTI_SIGNATURE_REGISTRATION
          end
        end
      end
    end
  end
end
