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

main() {
  int jok = 0;
  int rosszak = 0;
  for (int i=0; i < 5; i++) {
    var n = rnd.nextInt(szavak.length);
    var szo = szavak[n];
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
