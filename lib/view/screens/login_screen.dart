import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unforgett/controllers/user.dart';
import 'package:unforgett/model/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController authCode = TextEditingController();

  late Future<UserAuthModel>? user;
  String? error;
  String? status;
  String? _session;
  bool loadingDataUser = false;

  Future<void> checkSession() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _session = prefs.getString('session');
    });
  }

  Future<void> setSession(String? valueSession) async {
    final prefs = await SharedPreferences.getInstance();
    if (valueSession != null) {
      setState(() {
        prefs.setString('session', valueSession);
        _session = valueSession;
      });
    }
  }

  void checkSessionRediret(String? session) {
    if (session != null) {
      GoRouter.of(context).go('/profile');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    authCode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkSession().whenComplete(() => checkSessionRediret(_session));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              constraints: BoxConstraints(minWidth: 300, maxWidth: 400),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          final snackBar = SnackBar(
                            content: const Text('Not quite ready enough yet.'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Colors.grey.shade200,
                                    Colors.white,
                                    Colors.grey.shade200,
                                  ]),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black12,
                              )),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  'https://cdn3.iconfinder.com/data/icons/social-media-2169/24/social_media_social_media_logo_steam-48.png',
                                  width: 30,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'SIGN IN THROUGH STEAM',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      error != null
                          ? Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text(
                                error!,
                              ),
                            )
                          : const SizedBox(),
                      status == '1'
                          ? Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                controller: authCode,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Auth code',
                                ),
                              ),
                            )
                          : const SizedBox(),
                      loadingDataUser == false
                          ? TextButton(
                              onPressed: () {
                                loadingDataUser = true;
                                user = sendEmailAuth(
                                    emailController.text, authCode.text);
                                user!.then((errorRes) {
                                  setState(() {
                                    error = errorRes.error;
                                    status = errorRes.status;
                                    setSession(errorRes.session)
                                        .whenComplete(() {
                                      checkSessionRediret(_session);
                                      loadingDataUser = false;
                                    });
                                  });
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : CircularProgressIndicator(),
                      // Text(_session.toString()),
                      // Text(status.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
