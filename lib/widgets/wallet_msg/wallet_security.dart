import 'package:flutter/material.dart';

class WalletSecurityNote extends StatelessWidget {
  const WalletSecurityNote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                "Important note",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "* ",
                  style: TextStyle(
                      fontSize: 22,
                      color: theme.textTheme.headline1.color,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.30,
                child: Text(
                  "We don't save your account details that you are providing here.",
                  softWrap: true,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "* ",
                  style: TextStyle(
                      fontSize: 22,
                      color: theme.textTheme.headline1.color,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.30,
                child: Text(
                  "All the activities using your account was encypted and safely handled.",
                  softWrap: true,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
