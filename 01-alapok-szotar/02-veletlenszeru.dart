import 'dart:math';

var rnd = new Random(0);

List<String> szavak = [
  'simple',
  'vocabulary',
  'program',
];

main() {
  var n = rnd.nextInt(szavak.length);
  var szo = szavak[n];
  print('Egy véletlenszerű szó: ${szo}');
}
