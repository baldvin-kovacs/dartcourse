import 'dart:io';
import 'dart:math';

var rnd = new Random();

class Szo {
  String angolSzo;
  String magyarSzo;
  Szo(this.angolSzo, this.magyarSzo);
}

List<Szo> szavak = [
  new Szo('simple', 'egyszerű'),
  new Szo('vocabulary', 'szótár'),
  new Szo('program', 'program'),
];

Szo sorsol() {
  var n = rnd.nextInt(szavak.length);
  return szavak[n];
}

Set<String> voltMar = new Set();

Szo nemIsmeteltSzo() {
  if (voltMar.length == szavak.length) {
    voltMar = new Set();
  }
  Szo szo;
  while (true) {
    szo = sorsol();
    if (!voltMar.contains(szo.angolSzo)) {
      break;
    }
  }
  voltMar.add(szo.angolSzo);
  return szo;
}

main() {
  int jok = 0;
  int rosszak = 0;
  for (int i=0; i < 5; i++) {
    var szo = nemIsmeteltSzo();
    print('Egy véletlenszerű szó: angolul: ${szo.angolSzo}. Hogy van magyarul?');

    var valasz = stdin.readLineSync();
    if (valasz == szo.magyarSzo) {
      print('Helyes!');
      jok++;
    } else {
      print('Nem talált!');
      rosszak++;
    }
  }
  print("$jok jó, és $rosszak rossz választ adtál.");
}
