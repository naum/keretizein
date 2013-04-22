import 'dart:html';
import 'dart:async';
import 'horatio.dart';
import 'uha.dart';

var CB = query('#commandbar');
var PB = query('#pageboard');
var U = new UHA('UHA', 32);

void main() {
  window.console.log('hola mundo!');
  setupCommandBar();
  print("UHA: ${U.title}");
}

void loadWords(e) {
  HttpRequest.getString('/words.txt').then(processWords);
}

void processWords(w) {
  var wl = w.split("\n");
  //wl = wl.where((w) => w.length <=7).toList();
  window.console.log("wl.length: ${wl.length}");
  shuffle(wl);
  PB.innerHtml = wl.sublist(0, 13).join(' ');
}

void setupCommandBar() {
  var bulw = new ButtonElement();
  bulw.text = "generate random word list!";
  bulw.onClick.listen(loadWords);
  CB.append(bulw);
}

