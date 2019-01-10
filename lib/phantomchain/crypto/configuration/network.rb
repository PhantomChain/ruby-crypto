require 'phantomchain/crypto/networks/mainnet'

module PhantomChain
  module Crypto
    module Configuration
      # The holder of network configuration.
      class Network
        def self.get
          @network || PhantomChain::Crypto::Networks::Mainnet
        end

        def self.set(network)
          @network = network
        end
      end
    end
  end
end
