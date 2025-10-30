import 'package:firstprojectflutter/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageUrl),
      //leading - начальный,
      //trailing - конечный,
      //В LTR (слева направо) макете: leading = слева, trailing = справа.
      //В RTL (справа налево) макете: leading = справа, trailing = слева.
      title: Text(
        coin.name,
        style: Theme.of(context).textTheme.bodyMedium,
        //Тема регистрируется в контексте приложения и потом становится доступна
      ),

      subtitle: Text(
        '${coin.priceInUSD} \$', 
        style: theme.textTheme.labelSmall),

      trailing: const Icon(Icons.arrow_forward),

      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
        //.pushNamed() - это метод навигации которое открывает какую-то ссылку

        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => CryptoCoinScreen(),
        //     //builder - по дефолту что-то строит.
        //     //() - метод который возвращает виджет и в него передает контекст
        //     ),
        // );
        //Navigator.of(context) - Дефолтный навигатор Flutter для навигации.
        //.push(route) - открывает определенный виджет или экран.
      },

      //onTap - Callback метод который будет вызываться при нажатии
    );
  }
}
