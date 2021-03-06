describe PhantomChain::Crypto::Transactions::Builder::MultiSignatureRegistration do
  let(:keysgroup) do
    %w[
      +03a02b9d5fdd1307c2ee4652ba54d492d1fd11a7d1bb3f3a44c4a05e79f19de933
      +13a02b9d5fdd1307c2ee4652ba54d492d1fd11a7d1bb3f3a44c4a05e79f19de933
      +23a02b9d5fdd1307c2ee4652ba54d492d1fd11a7d1bb3f3a44c4a05e79f19de933
    ]
  end
  let(:lifetime) { 74 }
  let(:min) { 2 }

  let(:passphrase) { 'this is a top secret passphrase' }
  let(:second_passphrase) { 'this is a top secret second passphrase' }

  it 'should be ok with a passhrase' do
    PhantomChain::Crypto::Configuration::Network.set(PhantomChain::Crypto::Networks::Devnet)

    transaction = described_class.new
    .set_keysgroup(keysgroup)
    .set_lifetime(lifetime)
    .set_min(min)
    .sign(passphrase)

    expect(transaction.verify).to be_truthy
  end

  it 'should be ok with a second passphrase' do
    PhantomChain::Crypto::Configuration::Network.set(PhantomChain::Crypto::Networks::Devnet)

    transaction = described_class.new
    .set_keysgroup(keysgroup)
    .set_lifetime(lifetime)
    .set_min(min)
    .sign(passphrase)
    .second_sign(second_passphrase)

    second_public_key = PhantomChain::Crypto::Identities::PublicKey.from_passphrase(second_passphrase)

    expect(transaction.verify).to be_truthy
    expect(transaction.second_verify(BTC.to_hex(second_public_key))).to be_truthy
  end
end
