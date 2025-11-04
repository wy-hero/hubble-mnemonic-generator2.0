const { mnemonicToSeedSync, validateMnemonic } = require('@scure/bip39');
const { HDKey } = require('@scure/bip32');
const { sha256 } = require('@noble/hashes/sha256');
const { ripemd160 } = require('@noble/hashes/ripemd160');
const { bech32 } = require('@scure/base');

