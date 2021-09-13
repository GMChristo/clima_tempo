import 'package:angular/angular.dart';
import 'package:clima_tempo_browser/src/models/clima_model.dart';

@Injectable()
class ClimaService {
  final List<Clima> _climas = [];
  

  List<Clima> getAll(){
    return _climas;
  }

  Clima getSingleClima(String cidade) {
    return _climas.firstWhere((clima) => clima.cidade == cidade, orElse: () => throw StateError('Cidade não localizada'));
  }

  void addClima(Clima clima){
    _climas.add(clima);
    print('ClimaService addClima $_climas');
  }

}