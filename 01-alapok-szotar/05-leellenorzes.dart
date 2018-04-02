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
  var n = rnd.nextInt(szavak.length);
  var szo = szavak[n];
  var forditas = forditasok[n];
  print('Egy véletlenszerű szó: angolul: ${szo}. Hogy van magyarul?');

  var valasz = stdin.readLineSync();

  if (valasz == forditas) {
    print("Helyes!");
  } else {
    print("Nem talált!");
  }
}
