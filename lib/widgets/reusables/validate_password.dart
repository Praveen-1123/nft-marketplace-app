import 'package:nft/services/others/validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future validatePassword(
    BuildContext context, TextEditingController controller) {
  return showModalBottomSheet(
    backgroundColor: Theme.of(context).cardColor,
    context: context,
    isScrollControlled: true,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Text(
                  'Please enter your password',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.headline1.color,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextField(
                  cursorColor: Theme.of(context).focusColor,
                  keyboardType: TextInputType.visiblePassword,
                  controller: controller,
                  autofocus: true,
                  obscureText: true,
                  decoration: new InputDecoration(
                    fillColor: Theme.of(context).cardColor,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 5),
                    hintText: "Password...",
                    suffix: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: Icon(
                          CupertinoIcons.checkmark_alt,
                          color: Theme.of(context).focusColor,
                        ),
                        onPressed: () {
                          Validator().validatePassword(controller, context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        );
      },
    ),
  );
}
