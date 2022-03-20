import 'package:app/src/features/example/domain/entities/buuurovnica.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Buuurovnica bu;
  setUp(() {
    bu = Buuurovnica(name: "lalala", dangerLevel: 10000, horrorFactor: 1.0);
  });

  group("The methods work as expected", () {
    test('Horror factor should be infinte when burovnica says buuu', () {
      bu.sayBuuuuuu();
      expect(bu.horrorFactor, double.infinity);
    });

    test('Should fear a provocation from Osvald', () {
      bu.sprejmiProvokacijo("Osvald");
      expect(bu.horrorFactor, double.negativeInfinity);
    });

    test("ne boji se drugih provokatojev", () {
      bu.sprejmiProvokacijo("rand person");
    });
  });
}
