
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirrorwall/screen/provider/google_provider.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providertrue = Provider.of<GoogleProvider>(context);
    final providerfalse = Provider.of<GoogleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('BookMark Lists'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(providertrue.bookmarkList.length, (index) => ListTile(
              onTap: () {
                providerfalse.openWebsite(providertrue.bookmarkList[index].url);
                Navigator.pop(context);
              },
              title: Text(providertrue.bookmarkList[index].title),
              subtitle: Text(providertrue.bookmarkList[index].url,overflow: TextOverflow.ellipsis,),
              trailing: CupertinoButton(
                onPressed: () {
                  providerfalse.removeBookMark(index);
                },
                child: Icon(Icons.cancel),
              ),
            ))
        ),
      ),
    );
  }
}
