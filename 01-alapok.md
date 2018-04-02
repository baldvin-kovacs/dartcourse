# 1. Egy szótár program

## 1.1. Szavak listája

### 1.1.1. Egyszerű típusok

```dart
String v = 'almafa';  // A v egy String (szöveg) típusú vátozó,
                      // kezdeti értéke "almafa".

int x = 42;  // Az x egy int (egész szám) típusú változó,
             // kezdeti értéke 42.

double y = 1.5;  // Az y egy double (valós szám) típusú változó,
                 // kezdeti értéke 1.5. 

bool kicsiABorsDeEros = true;  // A kicsiABorsDeEros egy bool
                               // (boolean, igaz/hamis) típusú
                               // változó, kezdeit értéke true.
                               // A bool csak kétféle értékű lehet,
                               // true és false.
```

Ha kódot olvasunk, találkozhatunk a `num` típussal, ami az `int` és a `double` közös őse.
Azt jelenti, hogy "int vagy double". Saját kódban ne használjuk.

### 1.1.2. A `var` kulcsszó

Nem kötelező megadnunk hogy milyen típusú a változó, ha a gép magától is ki tudja
találni. Olyankor elég csak annyit írnunk, hogy `var`, azaz "variable":

```dart
var x = 42;
```

### 1.1.3. A `null`

A `null` azt jelenti, hogy egy változónak nincs értéke. Ez lehet például úgy,
hogy nem adunk meg kezdeti értéket:

```dart
int x;
```

Amikor nem adunk meg kezdeti értéket, olyankor mindig írjuk ki a változó
típusát, és ne használjuk a `var` kulcsszót.

### 1.1.4. Listák

```dart
List<String> zoldsegek;  // Egy String lista. Vigyázat, nem üres, hanem null!

List<String> zoldsegek = [];  // Egy üres String lista.

List<String> zoldsegek = ['alma', 'korte'];  // Egy String lista kezdeti
                                             // értékkel.

var zoldsegek = ['alma', 'korte'];  // A gép ki bírja találni, hogy mi a típus.

String zoldseg = zoldsegek[1];  // A zöldség értéke korte lesz, mert az első elem sorszáma 0,
                                // így a másodiké 1.
```

A `List` osztály [dokumentációja](https://api.dartlang.org/stable/1.24.3/dart-core/List-class.html) ad
részletes leírást arról, hogy miként kell a hosszát lekérdezni (`length`), vagy éppen hozzátenni
egy új elemet (`add`).

A dokumentációba érdekes belenézni, de sem megtanulni, sem igazán átolvasni nem szükséges a folytatáshoz.

### 1.1.5. Kiíratás

```dart
print('valami string');

String zoldseg = 'alma';
print(zoldseg);
```

### 1.1.6. String interpolation

```dart
String kicsoda = 'kugli';
String valami = 'Elmegy a $kicsoda egy este berugni';
```

A `$` után egész kifejezéseket is írhatunk, de akkor kapcsos zárójelek is kellenek:

```dart
int utolso = 17;
String kiiras = 'A következő játékos sorszáma: ${utolso + 1}';
```

### 1.1.7. A main függvény

A gép a `main` függvényt keresi és indítja el, amikor a `dart valami.dart` paranncsal a
`valami.dart` programot futtatjuk. Ha nincs `main`, akkor nincs ami fusson.

```dart
main() {
    ...
}
```

### 1.1.8. Feladat

Írjunk egy programot, amelyikben van egy lista. A listában legyen néhány angol szó.
A program írja ki, a szavakat, például így:

```
Néhány szó: [simple, vocabulary, program]
```

Futtassuk le, így:

```sh
dart programneve.dart
```

## 1.2. Véletlenszerű szó

### 1.2.1. Véletlenszámgenerátor

Ahhoz, hogy véletlen számokat tudjunk generálni, ahhoz a `dart:math` package-ből a `Random` osztályt
kell használnunk. Később tanuljuk meg, hogy mik azok a package-ek, és mik azok az osztályok.
Most annyit kell csak tudnunk, hogy a program tetején meg kell adnunk, hogy milyen package-eket
használunk, most éppen:

```dart
import 'dart:math';
```

A `Random` osztályból pedig kell egy példányt készítenünk, így:

```dart
var rnd = new Random();
```

Ezután bárhol a programunkban tudunk kapni egy véletlen számot az `rnd.nextInt` segítségével.
Például egy olyat, ami legalább 0, és kisebb mint 25, így:

```dart
var szam = rnd.nextInt(25);
```

### 1.2.2. Lista valahanyadik eleme

```dart
var szo = szavak[2];  // a szavak lista 3. eleme (a szavak[0] az első)

var szo = szavak[n];  // a szavak lista n-1. eleme
```

### 1.2.3. Lista hossza

```dart
var l = szavak.length;
```

### 1.2.4. Feladat

Alakítsuk át az előző programot úgy, hogy ne az egész listáját írja ki a szavaknak, hanem csak
egy véletlenszerű szót.

## 1.3. Véletlenszerű szó és a fordítása

### 1.3.1. Feladat

Alakítsuk át az előző programot úgy, hogy ne csak egy lista legyen benne angol szavakkal, hanem
még egy, a magyar fordításaikkal. A program írjon ki egy véletlenszerű szót, és az angol fordítását is,
azaz valami ilyesmit:

```
Egy véletlenszerű szó: angolul: vocabulary magyarul: szótár
```

## 1.4. Beolvasás

### 1.4.1. Standard input

A standard input általában a billentyűzetről jön. Így tudunk egy sort beolvasni:

```dart
import 'dart:io';

String sor = stdin.readLineSync();
```

### 1.4.2. Feladat

Írjunk egy programot, amelyik kiír egy véletlenszerű angol szót, és megkérdezi, hogy hogy van
magyarul? Ezután beolvas valamit a felhasználótól, és kiírja azt is, meg a jó választ is:

```
Ezt mondtad: kukurikú, ez a jó válasz: szótár.
```

## 1.5. A válasz leellenőrzése

### 1.5.1. `if`

```dart
if (a == b) {
    print('egyenlőek');
} else {
    print('nem egyenlőek');
}
```

Az `a == b` helyére persze bármilyen logikai (bool) értéket írhatunk. A tagadás jele a
`!`. A `!(a == b)` jelentése: nem igaz, hogy `a` egyenlő `b`-vel. Ennek van egy rövid
formája is: `a != b`.

A "vagy" jele: `||`. Az "és" jele: `&&`.

Mit jelent vajon, hogy `(a && b) || (!a && c)`? A zárójelek jelölik ki, hogy mit kell
először értelmeznünk: az `a && b` jelentése, hogy `a` is igaz, meg `b` is igaz.
A `!a && c` jelentése: `a` nem igaz, de `c` igaz. A `(a && b) || (!a && c)`
kifejezés tehát akkor igaz, ha `a` és `b` is igaz, vagy pedig `a` nem igaz, de `c` igaz.

### 1.5.2. Feladat

Írjuk át az előző programot úgy, hogy ellenőrizze le, jó választ adtunk-e. Ha igen,
akkor írja ki hogy "Helyes!", ha nem, akkor írja ki hogy "Nem talált!".

## 1.6. Több kérdés feltevése

### 1.6.1. Egész szám növelése

Egy `int` típusú változó értékét a `++` operátorral tudjuk eggyel megnövelni:

```dart
i++;
```

### 1.6.2. `for` ciklus

```dart
for (int i=0; i < 5; i++) {
  print(i)
}
```

A `for` ciklus a bajuszos zárójelekben levő dolgot (a ciklusmagot) többször egymás után is
lefuttatja.

A `for (kezdetben; feltétel; utána)` részeinek a jelentése:

- `kezdetben`: ami itt van, annak a végrehajtásával kezdi.
- `feltétel`: a ciklusmag minden futtatása előtt leellenőrzi, hogy ez igaz-e. Ha nem, akkor nem fut tovább.
- `utána`: ha lefutott a ciklusmag, akkor végrehajtja ezt.

### 1.6.3. Feladat

Oldjuk meg, hogy az előző program ötször egymás után csinálja meg azt, amit eddig csinált.
Azaz sorsoljon egy szót, írja ki, kérdezze meg hogy hogy van angolul, és írja ki hogy stimmelt-e
a válasz!

## 1.7. Hányszor stimmelt?

### Feladat

Alakítsuk át az előző programot úgy, hogy a végén írja ki, hogy hányszor adtunk jó választ, és hányszor rosszat.

Hint: hozzunk létre egy `int` változót a jó, és egy másikat a rossz válaszok számának. Mindig amikor kiírjuk
hogy "Helyes!", akkor növeljük meg a jó válaszok számának változóját, amikor meg hogy "Nem talált!", akkor
a rossz válaszokét.

