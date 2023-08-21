import 'package:flutter/material.dart';
import 'package:unforgett/view/widgets/appbar_widget.dart';

class GamesListScreen extends StatefulWidget {
  const GamesListScreen({super.key});

  @override
  State<GamesListScreen> createState() => _GamesListScreenState();
}

class _GamesListScreenState extends State<GamesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(child: Text('data'), title: 'App bat custom'),
      // AppBar(
      //   title: const Text('User profile'),
      //   automaticallyImplyLeading: false,
      //   centerTitle: false,
      //   actions: const [
      //     Icon(
      //       Icons.monitor,
      //     ),
      //     SizedBox(width: 20),
      //     Icon(
      //       Icons.search,
      //     ),
      //     SizedBox(width: 20),
      //     Icon(
      //       Icons.person_pin,
      //     ),
      //     SizedBox(width: 10),
      //   ],
      // ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'User info',
            ),
            Text(''),
          ],
        ),
      ),
    );
  }
}
