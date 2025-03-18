import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderSetup {
  static List<SingleChildWidget> getProviders() {
    return [
      // ChangeNotifierProvider(create: (_) => SignUpNotifier()),
    ];
  }
}
