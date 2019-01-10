require 'phantomchain/crypto/enums/fees'
require 'phantomchain/crypto/enums/types'
require 'phantomchain/crypto/identities/public_key'
require 'phantomchain/crypto/transactions/builder/base'

module PhantomChain
  module Crypto
    module Transactions
      module Builder
        # The builder for second signature registration transactions.
        class SecondSignatureRegistration < Base
          def set_second_passphrase(second_passphrase)
            @transaction.asset = {
              signature: {
                public_key: PhantomChain::Crypto::Identities::PublicKey.from_passphrase(second_passphrase)
              }
            }
            self
          end

          def type
            PhantomChain::Crypto::Enums::Types::SECOND_SIGNATURE_REGISTRATION
          end
        end
      end
    end
  end
end
