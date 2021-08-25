import 'dart:convert';
import 'dart:html';
import 'package:desafio_totvs_browser/src/models/cidade_model.dart';
import 'package:desafio_totvs_browser/src/models/clima_model.dart';
import 'package:http/http.dart' as http;

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'home-page',
  templateUrl: 'home_page.html',
  styleUrls: ['home_page.css'],
  directives: [
    coreDirectives,
    formDirectives,
  ],
)
class Home implements OnInit {
  var cidadeCep;
  bool showResults = false;
  Clima clima;
  Cidade cidade;

  @override
  void ngOnInit() {
    print('Pagina inicial ok!');
  }

  void pesquisaDeClimaPorLocalidade() {
    var testeInt = int.tryParse(cidadeCep);
    if (testeInt == null) {
      pesquisaPorCidade(cidadeCep);
    } else {
      pesquisaPorCep();
    }
    print(showResults);
  }

  void pesquisaPorCep() async {
    try {
      var url = Uri.parse('https://viacep.com.br/ws/$cidadeCep/json/');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var temp = jsonResponse;
        cidade = Cidade.fromMap(temp);
        pesquisaPorCidade(cidade.nome);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void pesquisaPorCidade(nomeCidade) async {
    try {
      var url = Uri.parse(
          'https://weather.contrateumdev.com.br/api/weather/city/?city=$nomeCidade');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var temp = jsonResponse['main'];
        clima = Clima.fromMap(temp);
        print('${clima.tempAtual}');
        showResults = true;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
