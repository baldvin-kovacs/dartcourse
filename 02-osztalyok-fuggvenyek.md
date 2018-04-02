# 2. Picit okosabb szótár program

## 2.1. Egy egyszerű osztály

### 2.1.1. Osztályok

Az egyszerű típusokat (`int`, `double`, `String` és `bool`) képzelhetjük úgy,
mint egy-egy fiókot, amibe beteszünk egy dolgot, és utána ki tudjuk olvasni,
hogy mit tettünk be.

Előfordul, hogy több dolgot együtt szeretnénk valahogy elnevezni. Mintha
lenne egy fiókunk, amiben van két kis rekesz.

A szótárprogram esetében például nagyon jól jönne, ha tudnánk egy
szópárt egyszerre tenni egy változóba.

Jelenleg külön tartunk egy listát az angol szavaknak, és egyet a magyar
szavaknak. Milyen jó jenne, ha tudnánk egy listát fenntartani a "szópár"-oknak.

```dart
class Szo {
  String angolSzo;
  String magyarSzo;
}
```

Ez a deklaráció egy `Szo` nevű típust készít. Azaz mostantól ez is egy típus.
Ilyen típusaink vannak: `int`, `double`, `String`, `bool`, `List<...>`, és `Szo`.

A saját típusainknak mindig nagybetűvel kezdődő nevet adjunk, a változóinknak
és a függvényeinknek mindig kisbetűvel kezdőtőt.

Egy `Szo` típusú változót így tudunk készíteni:

```dart
Szo valami = new Szo();
```

Ha már megvan, akkor hozzáférhetünk az adattagjaihoz:

```dart
valami.angolSzo = 'elephant';
valami.magyarSzo = 'elefánt';
```

Ebben a példában a `new Szo()` létrehozott egy üres `Szo` típusú objektumot (1. lépés),
majd később feltöltöttük adattal (2. lépés).

 Lehet egy lépésben is, de ahhoz meg kell
adni, hogy mi történjen a létrehozáskor. Egy függvényt, úgynevezett konstruktor
függvényt kell írnunk, így:

```dart
class Szo {
  String angolSzo;
  String magyarSzo;
  Szo() (String a, String m) {
      this.angolSzo = a;
      this.magyarSzo = m;
  }
}
```

Ezután már egy lépésben is létre tudjuk hozni a `Szo` osztály egy feltöltött
(inicializált) példányát:

```dart
Szo valami = new Szo('elephant', 'elefánt');
```

### 2.1.2. Feladat

Írjuk át a szótárprogramunkat úgy, hogy a szavak egy `List<Szo>` típusú listában
legyenek, és ne két `List<String>` típusúban.

```dart
List<Szo> szavak = [
  mi jön ide,
  meg ide,
  meg ide,
];
```

Eddig `String`-ek jöttek oda, de most mindegyik helyre `new Szo('angol változat', 'magyar változat')` kerül.

## 2.2. A konstruktor egyszerűbb formája

#### 2.2.1. A `this` argumentum

A konstruktor nagyon gyakran semmi mást nem csinál, csak átveszi a paramétereit,
és letárolja a megfelelő mezőkbe. Ezt az egyszerű műveletet lehet rövidített írásmóddal
is jelölni:

```dart
class Szo {
  String angolSzo;
  String magyarSzo;
  Szo(this.angolSzo, this.magyarSzo);
}
```

### 2.2.2. Feladat

Írjuk át a programunkat úgy, hogy a `Szo` osztálynak ilyen egyszerűsített konstruktora
legyen.

## 2.3. Strukturált kód

### 2.3.1. Függvények

Képzeljük el, hogy tudunk készíteni egy kis pici gépecskét a gépben, aminek adunk egy
nevet, és az csinálni tud nekünk dolgokat. Az ilyet függvénynek hívjuk.

Úgy működik, hogy adunk neki "paramétereket", a függvény dolgozik egy kicsit, és
visszaad valamit, a "visszatérési értéket".

Például egy összeadó függvénynek a paraméterei lehetnek egész számok, és a visszatérési
értéke is egész szám.

Egy képernyőre író függvény paraméterei lehetnek például `String`-ek, a visszatérési
értéke pedig semmi, azaz `void`.

Amikor egy függvényt készítünk a programunkban, akkor megadjuk hogy milyen típusú
a visszatérési értéke, mi a neve, milyen paramétereket kell neki adni, mit csinál
a paramétereivel, és mit ad vissza.

Valahogy így:

```dart
int ossszead(int a, int b) {
  return a + b;
}
```

Ha nincsenek paraméterek, akkor is kell írnunk zárójelet. Például egy szó-sorsoló
függvény nézhet ki így valahogy:

```dart
Szo sorsol() {
  // Itt valahogy kisorsolunk egy szót, és beletsszük a szo nevű változóba.
  // Vegyük észre, hogy a típus neve nagybetűs Szo, a változó neve kisbetűs
  // szo. A kettő nem ugyanaz!
  var szo = ...;
  return szo;
}
```

### 2.3.2. Feladat

Írjuk át az előző programunkat úgy, hogy a szó kisorsolása kerüljön át a `main`-ből
egy `sorsol` függvénybe! A `main`-ben ne legyen `rnd.nextInt` hívás, a `main`
legyen szép, tiszta és olvasható, és használja az új függvényt a `szo`
kisorsolására. Azaz a

```dart
var n = rnd.nextInt(szavak.length);
var szo = szavak[n];
```

helyett legyen csak

```dart
var szo = sorsol();
```

## 2.4. Nincs ismétlés

### 2.4.1. Halmazok (`Set`)

A `Set<...>` hasonló mint a `List<...>`, de az csak azt tudja,
hogy mit tettünk bele, azt nem, hogy milyen sorrendben.

Akkor miért érdekes, miért ne használhatnánk a `List<...>`-et
mindig?

Azért, mert egy `List<...>` esetén arra a kérdésre, hogy valami benne van-e,
csak úgy lehet válaszolni,
hogy végignézzük az egészet. Ezzel szemben a `Set` olyan, hogy meg tudjuk tőle
kérdezni, hogy valami benne van-e, és azonnal megmondja.

Így tudunk készíteni egy halmazt:

```dart
Set<string> nevek = new Set();
```

Adjuk meg mindig a típust, azaz ne csak `var`-t írjunk elé, mert a konstruktor
általános, abból nem tudná a gép, hogy miknek a halmazát akarjuk.

Így tudunk beletenni dolgokat, és megnézni, hogy valami benne van-e:

```dart
nevek.add('Juli');
nevek.add('Karcsi');

if (nevek.contains('Juli')) {
  print("benne van");  // kiíródik
}

if (nevek.contains('Feri')) {
  print("benne van");  // nem íródik ki
}
```

### 2.4.2. A `Set` elemeinek a száma

A `nevek.length` adja meg, hogy hány elemet tettünk a `nevek` halmazba.

### 2.4.3. A `while` ciklus

```dart
int n = 15;

while (n > 0) {
  print(n);
  n--;
}
```

A `while` ciklus megnézi, hogy teljesül-e a megadott feltétel, a példában azt, hogy `n`
pozitív szám-e. Ha igen, akkor végrehajtja a bajuszos zárójelben levő utasításokat.
Utána újra megnézi a feltételt, és ezt ismétli mindaddig, amíg a feltétel igaz.

Ha nem tettük volna a ciklusmagba az `n--;` utasítást, akkor ezt csinálná örökké.
Mivel az `n--` minden lépésben eggyel csökkenti az `n` értékét, ezért ez a ciklus
15 lépés után véget ér.

### 2.4.4. A `while(true)` ciklus, `break`-kel.

```dart
while (true) {
  ...
  if (...) {
    break;
  }
  ...
}
```

A `while (true)` jelentése: örökké ismételgesd a ciklusmag végrehajtását (hiszen a `true`
az mindig igaz).

A ciklusmagon belül a `break` utasítás azt jelenti: "na most viszont elég, ugorj ki,
és hagyd abba a ciklusmag ismételgetését.

### 2.4.5. Feladat

Egészítsük ki a programunkat úgy, hogy ne ismételje a kérdéseit, csak ha már elfogytak.

Ezt a feladatot sokféleképpen meg lehet oldani. Itt egy egyszerű megoldást adunk,
amelyik nem tökéletes, de működik.

Valami ilyesmi a cél:

```dart

Szo sorsol() {
  ...
}

Set<String> voltMar = new Set();

Szo nemIsmeteltSzo() {
  - ha a voltMar elemeinek a szama egyenlő a szavak elemeiken a számával,
    akkor a voltMar legyen egy új üres Set.

  - készítünk egy Szo típusú, szo nevű változót

  while (true) {
    szo = sorsol()

    - ha a szo.angolSzo nincs benne a voltMar Set-ben, akkor `break`.
      Azt, hogy "ha nincs benne", így tudjuk kifejezni:
      if (!voltMar.contains(szo)) { ... }
  }

  - a szo.angolSzo legyen hozzáadva a voltMar Set-hez
  return szo
}

main() {
  ...
  var szo = nemIsmeteltSzo();  // a sorsol() helyett.
  ...
}
```
