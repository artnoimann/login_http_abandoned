import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unforgett/model/user_model.dart';
import 'package:unforgett/view/widgets/appbar_widget.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late Future<UserAuthModel>? user;
  String? error;
  String? status;
  String? _session;

  Future<void> checkSession() async {
    final _prefs = await SharedPreferences.getInstance();

    setState(() {
      _session = _prefs.getString('session');
    });
  }

  Future<void> setSession(String? valueSession) async {
    final _prefs = await SharedPreferences.getInstance();
    if (valueSession != null) {
      _prefs.setString('_session', valueSession);

      setState(() {
        _session = _prefs.getString('session');
      });
    }
  }

  void checkSessionRediret(String? session) {
    if (session == null) {
      GoRouter.of(context).go('/');
    }
  }

  @override
  void initState() {
    super.initState();
    checkSession().whenComplete(() => checkSessionRediret(_session));
  }

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
            Text(
              _session.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
