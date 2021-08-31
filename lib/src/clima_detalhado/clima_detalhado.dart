import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

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
  @override
  void ngOnInit() {
    print('ClimaDetalhado iniciado!');
  }

}