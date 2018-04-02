import 'dart:math';

var rnd = new Random(0);

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
  print('Egy véletlenszerű szó: angolul: ${szo} magyarul: ${forditas}');
}
