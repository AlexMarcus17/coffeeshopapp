import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/order_bloc.dart';
import '../widgets/orderitem.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _timevalue = 1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        var list = [...(state as OrderList).list];
        late int removedays;
        switch (_timevalue) {
          case 1:
            removedays = 1;
            break;
          case 2:
            removedays = 7;
            break;
          case 3:
            removedays = 30;
            break;
          case 4:
            removedays = 90;
            break;
        }
        if (_timevalue == 1 ||
            _timevalue == 2 ||
            _timevalue == 3 ||
            _timevalue == 4) {
          list.removeWhere((element) => element.dateTime
              .isBefore(DateTime.now().subtract(Duration(days: removedays))));
        }
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 237, 201, 154),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              backgroundColor: Color.fromARGB(0, 249, 153, 57),
              elevation: 0,
              centerTitle: true,
              title: ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(colors: [
                    Color.fromARGB(255, 123, 55, 30),
                    Color.fromARGB(255, 182, 118, 54),
                    Color.fromARGB(255, 155, 77, 0)
                  ]).createShader(bounds);
                },
                child: Text(
                  "Mocha Moments",
                  style: TextStyle(
                      fontFamily: "Food Zone",
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8, left: 18, right: 12, bottom: 18),
                      child: Text(
                        "My Orders",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontFamily: "Cartoonist",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8, left: 12, right: 18, bottom: 18),
                      child: Container(
                        color: Color.fromARGB(255, 237, 201, 154),
                        child: DropdownButton<int>(
                            iconEnabledColor: Colors.black,
                            focusColor: Colors.white,
                            value: _timevalue,
                            elevation: 5,
                            items: [
                              "Last day",
                              "Last 7 days",
                              "Last 30 days",
                              "Last 90 days",
                              "All",
                            ].map<DropdownMenuItem<int>>((e) {
                              int i = 1;
                              switch (e) {
                                case "Today":
                                  i = 1;
                                  break;
                                case "Last 7 days":
                                  i = 2;
                                  break;
                                case "Last 30 days":
                                  i = 3;
                                  break;
                                case "Last 90 days":
                                  i = 4;
                                  break;
                                case "All":
                                  i = 5;
                                  break;
                              }
                              return DropdownMenuItem(
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    fontFamily: "Cartoonist",
                                  ),
                                ),
                                value: i,
                              );
                            }).toList(),
                            onChanged: ((value) => setState(() {
                                  _timevalue = value ?? 1;
                                }))),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, id) {
                      return OrderItem(list[id]);
                    },
                    itemCount: list.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
