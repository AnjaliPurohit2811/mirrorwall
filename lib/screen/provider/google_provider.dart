import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirrorwall/screen/model/url_model.dart';

import '../utils/global_variable.dart';

class GoogleProvider extends ChangeNotifier{
  String searchText = '';
  double progress = 0;
  List<BookMarkmodel> bookmarkList = [];
  List<BookMarkmodel> historyList =[];
  String? currentUrl;
  String? title;
  BookMarkmodel? bookMarkmodal;
  WebUri uri= WebUri('https://www.google.com');

  void onChangeProgress(int progress){
    this.progress = progress / 100;
    notifyListeners();
  }

  void onChangesearch(String searchText){
    this.searchText = searchText;
    notifyListeners();
  }

  Future<void> setCurrentUrl(url)  async {
    currentUrl =  url.toString();
    title =await inAppWebViewController.getTitle();
    bookMarkmodal = BookMarkmodel(title: title!, url:currentUrl!);
    historyList.add(bookMarkmodal!);
    notifyListeners();
  }

  void addToBookMark(){
    bookmarkList.add(bookMarkmodal!);
    notifyListeners();
  }

  void removeHistory(int index)
  {
    historyList.removeAt(index);
    notifyListeners();
  }

  void removeBookMark(int index)
  {
    bookmarkList.removeAt(index);
    notifyListeners();
  }

  void openWebsite(url)
  {
    currentUrl = url;
    inAppWebViewController.loadUrl(urlRequest: URLRequest(url: WebUri(currentUrl!)));
    notifyListeners();
  }

  void Changewebview(value)
  {
    uri = WebUri(value);
    inAppWebViewController.loadUrl(urlRequest: URLRequest(url: uri));
    notifyListeners();
  }
}
