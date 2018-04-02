import 'dart:io';
import 'dart:math';

var rnd = new Random();

List<String> szavak = [
  'simple',
  'vocabulary',
  'program',
];

List<String> forditasok = [
  'egyszerű',
  'szótár',
  'program',
];

main() {
  int jok = 0;
  int rosszak = 0;
  for (int i=0; i < 5; i++) {
    var n = rnd.nextInt(szavak.length);
    var szo = szavak[n];
    var forditas = forditasok[n];
    print('Egy véletlenszerű szó: angolul: ${szo}. Hogy van magyarul?');

    var valasz = stdin.readLineSync();
    if (valasz == forditas) {
      print('Helyes!');
      jok++;
    } else {
      print('Nem talált!');
      rosszak++;
    }
  }
  print("$jok jó, és $rosszak rossz választ adtál.");
}
