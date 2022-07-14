import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nft/constants/gradients.dart';
import 'package:nft/mocks/nfts.dart';
import 'package:nft/models/nfts_model.dart';
import 'package:nft/views/nfts/nft_card.dart';
import 'package:nft/widgets/reusables/gradient_text.dart';

class MainNftPage extends StatefulWidget {
  const MainNftPage({Key key}) : super(key: key);

  @override
  _MainNftPageState createState() => _MainNftPageState();
}

class _MainNftPageState extends State<MainNftPage> {
  @override
  void initState() {
    super.initState();
    getMocks();
  }

  @override
  void dispose() {
    _nftsController.close();
    super.dispose();
  }

  List<NftToken> nfts = [];
  final _nftsController = StreamController<List<NftToken>>.broadcast();

  Future getMocks() async {
    try {
      List nftsJson = nftsMock['result']['nfts']['docs'];
      nfts = nftsJson.map<NftToken>((json) => NftToken.fromJson(json)).toList();
      _nftsController.sink.add(nfts);
      setState(() {});
      return true;
    } catch (e) {
      print("error::getmocks::catch $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height - 100,
                child: StreamBuilder<List<NftToken>>(
                  stream: _nftsController.stream,
                  builder: (
                    BuildContext ctx,
                    AsyncSnapshot<List<NftToken>> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      List<NftToken> data = snapshot.data;
                      nfts = data;
                    }
                    return Container(
                      height: size.height,
                      child: ListView(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: GradientText(
                              "NFT Market",
                              gradient: AppGradients().appGradient,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Orbitron',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5),
                            ),
                          ),
                          ...nfts.map(
                            (NftToken nfts) {
                              return NftCard(
                                feed: nfts,
                              );
                            },
                          ).toList(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
