require 'phantomchain/crypto/enums/fees'
require 'phantomchain/crypto/enums/types'
require 'phantomchain/crypto/identities/public_key'
require 'phantomchain/crypto/transactions/builder/base'

module PhantomChain
  module Crypto
    module Transactions
      module Builder
        # The builder for delegate registration transactions.
        class DelegateRegistration < Base
          def set_username(username)
            @username = username
            self
          end

          def sign(passphrase)
            @transaction.asset = {
              delegate: {
                username: @username,
                public_key: PhantomChain::Crypto::Identities::PublicKey.from_passphrase(passphrase)
              }
            }
            sign_and_create_id(passphrase)
          end

          def type
            PhantomChain::Crypto::Enums::Types::DELEGATE_REGISTRATION
          end
        end
      end
    end
  end
end
