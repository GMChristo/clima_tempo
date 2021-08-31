import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:clima_tempo_browser/src/models/clima_model.dart';

@Component(
  selector: 'clima-detalhado',
  templateUrl: 'clima_detalhado.html',
  styleUrls: ['clima_detalhado.css'],
  directives: [
    coreDirectives,
    formDirectives,
  ],
)
class ClimaDetalhado implements OnInit{
  Clima clima = Clima();

  @override
  void ngOnInit() {
    print('ClimaDetalhado iniciado!');
  }

}