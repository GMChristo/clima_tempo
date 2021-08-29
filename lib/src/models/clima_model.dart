class Clima {
  double tempAtual;
  double tempMin;
  double tempMax;
  double umidade;

  Clima({
    this.tempAtual,
    this.tempMin,
    this.tempMax,
    this.umidade,
  });

  Clima.fromMap(Map<String, dynamic> map) {
    tempAtual = map['temp'];
    tempMin = map['temp_min'];
    tempMax = map['temp_max'];
    umidade = map['humidity'];
  }

  Map<String, dynamic> toMap() {
    return {
      'tempAtual': tempAtual,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'umidade': umidade,
    };
  }
}
