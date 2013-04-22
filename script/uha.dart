library UHA;

import 'dart:math';
import 'horatio.dart';

var RNG = new Random();

class UHA {

  String title;
  num season = 0;
  num gamenum = 0;
  num totTeams;
  var freeagents = [];
  var clubs = [];
  var waived = [];
  var standings = {};
  var schedule = [];
  var skaterstats = {};
  var goaliestats = {};

  UHA([this.title='UHA', this.totTeams=24]) {
      genesis();
  }

  genesis() {
    print('genesis!');
    var xl = [1, 2, 3, 4, 5, 6];
    shuffle(xl);
    print(xl);
  }
  
}
