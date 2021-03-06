import 'dart:convert';
import 'package:angular_router/angular_router.dart';
import 'package:clima_tempo_browser/route_paths.dart';
import 'package:clima_tempo_browser/routes.dart';
import 'package:clima_tempo_browser/src/clima_detalhado/clima_detalhado.dart';
import 'package:clima_tempo_browser/src/models/cidade_model.dart';
import 'package:clima_tempo_browser/src/models/clima_model.dart';
import 'package:clima_tempo_browser/src/service/clima_service.dart';
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
    routerDirectives,
  ],
  exports: [
    RoutePaths,
    Routes,
  ],
  providers: [
    ClassProvider(ClimaService),
  ],
)
class Home {
  var cidadeCep;
  bool showResults = false;
  Clima clima;
  Cidade cidade = Cidade();
  // ClimaDetalhado climaDetalhado = ClimaDetalhado();
  final ClimaService _climaService;

  Home(this._climaService);

  // @override
  // void ngOnInit() {
  //    print('Pagina inicial ok!');
  // }

  void pesquisaDeClimaPorLocalidade() {
    var testeInt = int.tryParse(cidadeCep);
    if (testeInt == null) {
      pesquisaPorCidade(cidadeCep);
    } else {
      pesquisaPorCep();
    }
    // print(showResults);
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
    // print('antes try $nomeCidade');
    try {
      var url = Uri.parse(
          'https://weather.contrateumdev.com.br/api/weather/city/?city=$nomeCidade');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var temp = jsonResponse['main'];
        clima = Clima.fromMap(temp);
        clima.cidade = nomeCidade;
        // cidade.nome = nomeCidade;
        // print('cidade.nome: ${cidade.nome}');
        // print('clima.cidade: ${clima.cidade}');
        // print('nomeCidade: $nomeCidade');
        // print('cidade.nome: ${cidade.nome}');
        _climaService.addClima(clima);
        showResults = true;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void carregaDetalhes() {
    List<Clima> listClima = _climaService.getAll();
    print('carregaDetalhes: ${listClima[0].tempAtual}');
    // print('carrega Detalhes: $clima');
    // climaDetalhado.detalhes(clima);
  }
}
