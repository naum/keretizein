import 'dart:html';
import 'dart:async';
import 'dart:math';

var CB = query('#commandbar');
var PB = query('#pageboard');
var RNG = new Random();

void main() {
  window.console.log('hola mundo!');
  setupCommandBar();
}

void loadWords(e) {
  window.console.log('inside loadWords()...');
  HttpRequest.getString('/words.txt').then(processWords);
}

void processWords(w) {
  var wl = w.split("\n");
  wl = wl.where((w) => w.length <=7).toList();
  window.console.log("wl.length: ${wl.length}");
  shuffle(wl);
  PB.innerHtml = wl.sublist(0, 13).join(' ');
}

void setupCommandBar() {
  var bulw = new ButtonElement();
  bulw.text = "load words!";
  bulw.onClick.listen(loadWords);
  CB.append(bulw);
}

void shuffle(List l) {
  var n = l.length;
  while (n > 0) {
    var i = RNG.nextInt(n);
    n -= 1;
    var t = l[n];
    l[n] = l[i];
    l[i] = t;
  }
}
