class Cidade {
  String cep;
  String nome;
  String rua;
  String bairro;
  String uf;

  Cidade();

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'localidade': nome,
      'logradouro': rua,
      'bairro': bairro,
      'uf': uf,
    };
  }

  Cidade.fromMap(Map<String, dynamic> map) {
      cep = map['cep'];
      nome = map['localidade'];
      rua = map['logradouro'];
      bairro = map['bairro'];
      uf = map['uf'];
  }
}
