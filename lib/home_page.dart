import 'package:flutter/material.dart';

import 'donativos.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final Map<String, double> donativos = {
    "paypal": 0.0,
    "tarjeta": 0.0,
    "meta": 10000
  };

  @override
  State<HomePage> createState() => _HomePageState();
}

enum typesOfPayment { paypal, tarjeta }

class _HomePageState extends State<HomePage> {
  typesOfPayment? _selected = typesOfPayment.paypal;
  List<double> progressOptions = [25.0, 50.0, 75.0, 100.0];

  double? selectedProgress = 25.0;

  double getProgress() {
    double suma = widget.donativos["paypal"]! + widget.donativos["tarjeta"]!;
    return suma * 100.0 / widget.donativos["meta"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Donativos(
                      donativos: widget.donativos,
                    )));
          },
          child: Icon(
            Icons.arrow_forward,
          ),
        ),
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Es para una buena causa",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                ),
              ),
              Text(
                "Elija modo de donativo",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset('images/paypal.png'),
                        title: Text("Paypal"),
                        trailing: Radio(
                            value: typesOfPayment.paypal,
                            groupValue: _selected,
                            onChanged: (typesOfPayment? value) {
                              setState(() {
                                _selected = value;
                              });
                            }),
                      ),
                      ListTile(
                        leading: Image.asset('images/credit_card.png'),
                        title: Text("Tarjeta"),
                        trailing: Radio(
                            value: typesOfPayment.tarjeta,
                            groupValue: _selected,
                            onChanged: (typesOfPayment? value) {
                              setState(() {
                                _selected = value;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: DropdownButton<double>(
                  value: selectedProgress,
                  onChanged: (double? val) {
                    this.selectedProgress = val;
                    setState(() {});
                  },
                  items: progressOptions.map((double e) {
                    return DropdownMenuItem(
                      child: Text("$e"),
                      value: e,
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Progreso: ${getProgress()}%",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0,
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text("Donar"),
                  onPressed: () {
                    double value = (this.selectedProgress! *
                        widget.donativos["meta"]! /
                        100);
                    if (_selected == typesOfPayment.paypal) {
                      widget.donativos["paypal"] =
                          widget.donativos["paypal"]! + value;
                    } else {
                      widget.donativos["tarjeta"] =
                          widget.donativos["tarjeta"]! + value;
                    }
                    print(widget.donativos);
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
