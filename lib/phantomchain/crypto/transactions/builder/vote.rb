require 'phantomchain/crypto/enums/fees'
require 'phantomchain/crypto/enums/types'
require 'phantomchain/crypto/identities/address'
require 'phantomchain/crypto/transactions/builder/base'

module PhantomChain
  module Crypto
    module Transactions
      module Builder
        # The builder for vote transactions.
        class Vote < Base
          def set_votes(votes)
            @transaction.asset[:votes] = votes
            self
          end

          def sign(passphrase)
            @transaction.recipient_id = PhantomChain::Crypto::Identities::Address.from_passphrase(passphrase)
            sign_and_create_id(passphrase)
          end

          def type
            PhantomChain::Crypto::Enums::Types::VOTE
          end
        end
      end
    end
  end
end
