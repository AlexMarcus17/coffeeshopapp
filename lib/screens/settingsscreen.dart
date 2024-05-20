// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:coffeeshopapp/data/authrepo.dart';
import 'package:coffeeshopapp/data/orderrepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isLoading = false;
  String pass = "";
  TextEditingController passController = TextEditingController(text: "");
  TextEditingController textEditingController = TextEditingController(
      text: GetIt.I.get<SharedPreferences>().getString("username"));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? Center(
              child: Platform.isIOS
                  ? const CupertinoActivityIndicator(
                      radius: 20.0, color: CupertinoColors.activeBlue)
                  : const CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(top: 8, left: 18, right: 12, bottom: 18),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontFamily: "Cartoonist",
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        child: InkWell(
                          onTap: () {
                            showGeneralDialog(
                                barrierLabel: "",
                                barrierDismissible: true,
                                transitionDuration: const Duration(milliseconds: 250),
                                transitionBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  Tween<Offset> tween;
                                  tween = Tween(
                                      begin: const Offset(0, 1),
                                      end: Offset.zero);
                                  return SlideTransition(
                                    position: tween.animate(
                                      CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeInOut),
                                    ),
                                    child: child,
                                  );
                                },
                                context: context,
                                pageBuilder: (ctx, _, __) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    margin: const EdgeInsets.only(
                                        top: 150,
                                        bottom: 220,
                                        left: 20,
                                        right: 20),
                                    height: MediaQuery.of(context).size.height,
                                    child: KeyboardDismisser(
                                      child: Scaffold(
                                        resizeToAvoidBottomInset: false,
                                        backgroundColor: Colors.transparent,
                                        body: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "Username",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 60, 42, 4),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 36),
                                                child: TextField(
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                  decoration: const InputDecoration(
                                                      hintText: "",
                                                      border:
                                                          OutlineInputBorder(),
                                                      focusedBorder:
                                                          OutlineInputBorder(),
                                                      prefixIcon: Padding(
                                                        padding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8),
                                                        child: Icon(Icons
                                                            .account_circle_sharp),
                                                      )),
                                                  controller:
                                                      textEditingController,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  if (textEditingController.text
                                                          .trim()
                                                          .length >
                                                      2) {
                                                    try {
                                                      await GetIt.I
                                                          .get<AuthRepository>()
                                                          .changeName(
                                                            textEditingController
                                                                .text
                                                                .trim(),
                                                          );
                                                      GetIt.I
                                                          .get<
                                                              SharedPreferences>()
                                                          .setString(
                                                            "username",
                                                            textEditingController
                                                                .text
                                                                .trim(),
                                                          );
                                                      Navigator.of(context)
                                                          .pop();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Center(
                                                            child: Text(
                                                                "Username changed"),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  800),
                                                        ),
                                                      );
                                                    } catch (e) {}
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  elevation: 30.0,
                                                  backgroundColor: Colors.brown,
                                                  shadowColor: Colors.amber,
                                                  foregroundColor: Colors.amber,
                                                ),
                                                child: const Text(
                                                  "Enter",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily:
                                                          "Coffee Crafts"),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 90,
                                              )
                                            ]),
                                      ),
                                    ),
                                  );
                                }).then((value) {
                              textEditingController.text = GetIt.I
                                      .get<SharedPreferences>()
                                      .getString("username") ??
                                  "Name";
                            });
                          },
                          child: SizedBox(
                            height: 60,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              elevation: 5,
                              color: Colors.white,
                              child: const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.account_circle_sharp,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Change Username",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontFamily: "Cartoonist",
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 14,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/orders");
                          },
                          child: SizedBox(
                            height: 60,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              elevation: 5,
                              color: Colors.white,
                              child: const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.assignment,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Order History",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontFamily: "Cartoonist",
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 14,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: const Text('Are you sure?'),
                                  content: const Text(
                                      'If you log out, you will have to log in again.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.brown),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(color: Colors.brown),
                                      ),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await GetIt.I
                                            .get<AuthRepository>()
                                            .signOut();
                                        await GetIt.I
                                            .get<SharedPreferences>()
                                            .clear();
                                        setState(() {
                                          isLoading = false;
                                        });
                                        GetIt.I.get<OrderRepository>().reset();
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                "/getstarted");
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: SizedBox(
                            height: 60,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              elevation: 5,
                              color: Colors.white,
                              child: const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.logout,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Log Out",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontFamily: "Cartoonist",
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 14,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        child: InkWell(
                          onTap: () async {
                            bool confirmDelete = false;
                            await showGeneralDialog(
                              context: context,
                              barrierLabel: "",
                              barrierDismissible: true,
                              transitionDuration: const Duration(milliseconds: 250),
                              transitionBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                Tween<Offset> tween = Tween(
                                    begin: const Offset(0, 1),
                                    end: Offset.zero);
                                return SlideTransition(
                                  position: tween.animate(
                                    CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeInOut),
                                  ),
                                  child: child,
                                );
                              },
                              pageBuilder: (ctx, _, __) {
                                return Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  margin: const EdgeInsets.only(
                                      top: 150,
                                      bottom: 220,
                                      left: 20,
                                      right: 20),
                                  height: MediaQuery.of(context).size.height,
                                  child: KeyboardDismisser(
                                    child: Scaffold(
                                      resizeToAvoidBottomInset: false,
                                      backgroundColor: Colors.transparent,
                                      body: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Enter the password to delete your account",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 60, 42, 4),
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 36),
                                            child: TextField(
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                              decoration: const InputDecoration(
                                                hintText: "",
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                    OutlineInputBorder(),
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Icon(Icons
                                                      .account_circle_sharp),
                                                ),
                                              ),
                                              controller: passController,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              pass = passController.text;
                                              confirmDelete = true;
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              elevation: 30.0,
                                              backgroundColor: Colors.brown,
                                              shadowColor: Colors.amber,
                                              foregroundColor: Colors.amber,
                                            ),
                                            child: const Text(
                                              "Enter",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: "Coffee Crafts"),
                                            ),
                                          ),
                                          const SizedBox(height: 90),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );

                            if (confirmDelete) {
                              bool? confirmed = await showDialog<bool>(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoAlertDialog(
                                    title: const Text('Are you sure?'),
                                    content: const Text(
                                        'If you delete your account, all your data will be lost.'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Cancel',
                                            style:
                                                TextStyle(color: Colors.brown)),
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Yes',
                                            style:
                                                TextStyle(color: Colors.brown)),
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );

                              if (confirmed == true) {
                                setState(() {
                                  isLoading = true;
                                });

                                bool deleted = await GetIt.I
                                    .get<AuthRepository>()
                                    .deleteAccount(pass);

                                setState(() {
                                  isLoading = false;
                                });

                                if (deleted) {
                                  await GetIt.I
                                      .get<SharedPreferences>()
                                      .clear();
                                  GetIt.I.get<OrderRepository>().reset();
                                  Navigator.of(context)
                                      .pushReplacementNamed("/getstarted");
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Center(
                                            child:
                                                Text("Error deleting account")),
                                        duration: Duration(milliseconds: 800),
                                      ),
                                    );
                                  }
                                }
                              }
                            }

                            passController.text = "";
                          },
                          child: SizedBox(
                            height: 60,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              elevation: 5,
                              color: Colors.white,
                              child: const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.delete_forever,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "Delete Account",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontFamily: "Cartoonist",
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 14,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 6),
                        child: SizedBox(
                          height: 60,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            elevation: 5,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 22,
                                    child: Image.asset(
                                      "assets/veganicon.png",
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "Show Only Vegan",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                      fontFamily: "Cartoonist",
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Platform.isIOS
                                      ? CupertinoSwitch(
                                          activeColor: Colors.brown,
                                          value: GetIt.I
                                                  .get<SharedPreferences>()
                                                  .getBool("onlyvegan") ??
                                              false,
                                          onChanged: (val) {
                                            setState(() {
                                              GetIt.I
                                                  .get<SharedPreferences>()
                                                  .setBool("onlyvegan", val);
                                            });
                                          })
                                      : Switch(
                                          activeColor: Colors.brown,
                                          value: GetIt.I
                                                  .get<SharedPreferences>()
                                                  .getBool("onlyvegan") ??
                                              false,
                                          onChanged: (val) {
                                            setState(() {
                                              GetIt.I
                                                  .get<SharedPreferences>()
                                                  .setBool("onlyvegan", val);
                                            });
                                          }),
                                  const SizedBox(
                                    width: 14,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
