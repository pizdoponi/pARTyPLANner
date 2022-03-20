class Buuurovnica {
  final String name;
  final int dangerLevel;
  double horrorFactor;

  Buuurovnica({
    required this.name,
    required this.dangerLevel,
    required this.horrorFactor,
  }) : assert(dangerLevel > 9999);

  num get scariness => dangerLevel * horrorFactor;

  void sayBuuuuuu() => horrorFactor = double.infinity;

  /// Receive provocation from [person]
  void sprejmiProvokacijo(String person) {
    if (person == "Osvald") {
      horrorFactor = double.negativeInfinity;
    } else {
      sayBuuuuuu();
    }
  }
}
