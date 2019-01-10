require 'phantomchain/crypto/enums/fees'

module PhantomChain
  module Crypto
    module Configuration
      # The holder of fee configuration.
      class Fee
        @fees = [
          PhantomChain::Crypto::Enums::Fees::TRANSFER,
          PhantomChain::Crypto::Enums::Fees::SECOND_SIGNATURE_REGISTRATION,
          PhantomChain::Crypto::Enums::Fees::DELEGATE_REGISTRATION,
          PhantomChain::Crypto::Enums::Fees::VOTE,
          PhantomChain::Crypto::Enums::Fees::MULTI_SIGNATURE_REGISTRATION,
          PhantomChain::Crypto::Enums::Fees::IPFS,
          PhantomChain::Crypto::Enums::Fees::TIMELOCK_TRANSFER,
          PhantomChain::Crypto::Enums::Fees::MULTI_PAYMENT,
          PhantomChain::Crypto::Enums::Fees::DELEGATE_RESIGNATION
        ]

        def self.get(type)
          @fees[type]
        end

        def self.set(type, fee)
          @fees[type] = fee
        end
      end
    end
  end
end
