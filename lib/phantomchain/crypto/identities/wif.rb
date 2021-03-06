require 'btcruby'

module PhantomChain
  module Crypto
    module Identities
      # The identity utility for a WIF.
      class WIF
        def self.from_passphrase(passphrase, network = nil)
          network ||= PhantomChain::Crypto::Configuration::Network.get

          passphrase = Digest::SHA256.digest(passphrase)

          seed = [network.wif].pack('C*')
          seed << passphrase
          seed << [0x01].pack('C*')

          BTC::Base58.base58check_from_data(seed)
        end
      end
    end
  end
end
