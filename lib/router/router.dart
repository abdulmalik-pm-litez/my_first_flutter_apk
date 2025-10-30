import 'package:firstprojectflutter/features/crypto_coin/view/crypto_coin_screen.dart';
import 'package:firstprojectflutter/features/crypto_list/view/crypto_list_screen.dart';


final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
  //coin - будет открываться при надобности когда будет вызываться
};
