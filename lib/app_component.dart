import 'package:angular/angular.dart';
import 'package:clima_tempo_browser/src/home_page/home_page.dart';

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    coreDirectives,
    // formDirectives,
    // routerDirectives,
    Home,
  ],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
