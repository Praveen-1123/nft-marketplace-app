import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hex/hex.dart';
import 'package:web3dart/web3dart.dart';
import 'package:bip32/bip32.dart' as bip32;
import 'package:bip39/bip39.dart' as bip39;

// const ethereum =
//     "https://mainnet.infura.io/v3/21485433cdfb42388fbfe0f5da415eae";
const ethereum =
    "https://rinkeby.infura.io/v3/21485433cdfb42388fbfe0f5da415eae";

final httpClient = new Client();
final Web3Client ethClient = new Web3Client(ethereum, httpClient);

class BlockchainAPi {
  static String getSeed() {
    final seed = bip39.generateMnemonic();
    return seed;
  }

  static String privateKeyFromMnemonic(String mnemonic) {
    String seed = bip39.mnemonicToSeedHex(mnemonic);
    bip32.BIP32 root = bip32.BIP32.fromSeed(HEX.decode(seed));
    bip32.BIP32 child = root.derivePath("m/44'/60'/0'/0/0");
    String privateKey = HEX.encode(child.privateKey);
    return privateKey;
    
  }

  Future<String> getAddressFromPrivateKey(privateKey) async {
    try {
      final credentials = EthPrivateKey.fromHex(privateKey);
      return (await credentials.extractAddress()).toString();
    } catch (e) {
      return "Error in PrivateKey";
    }
  }

  Future<EtherAmount> getBalanceEth(String address) async {
    EthereumAddress a;
    if (address != null && address != "") {
      a = EthereumAddress.fromHex(address);
    }
    return await ethClient.getBalance(a);
  }

  Future<dynamic> sendTransactionEth(
    String address,
    String privateKey,
    EtherAmount amount,
    BigInt fees,
  ) async {
    try {
      Credentials credentials = EthPrivateKey.fromHex(privateKey);
      String txHash = await ethClient.sendTransaction(
          credentials,
          Transaction(
            to: EthereumAddress.fromHex(address),
            value: amount,
            gasPrice: EtherAmount.fromUnitAndValue(EtherUnit.gwei, fees),
            maxGas: 21000,
          ),
          chainId: null,
          fetchChainIdFromNetworkId: true);
      var data = {'txHash': txHash, 'status': true};
      return data;
    } catch (e) {
      var data = {'status': false};
      debugPrint('e $e');
      return data;
    }
  }
}
