import 'package:flutter/material.dart';

import 'donativos.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final Map<String, double> donativos = {
    "paypal": 0.0,
    "tarjeta": 0.0,
  };

  @override
  State<HomePage> createState() => _HomePageState();
}

enum typesOfPayment {paypal, tarjeta}

class _HomePageState extends State<HomePage> {

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
                        trailing: Radio(
                            value: typesOfPayment.paypal,
                            groupValue: ,
                            onChanged: (val) {}),
                      ),
                      ListTile(
                        leading: Image.asset('images/credit_card.png'),
                        trailing: Radio(
                            value: ,
                            groupValue: ,
                            onChanged: (val) {}),
                      ),
                    ],
                  ),
                ),
              ),
              TextField(),
              Text("0.0%"),
              ElevatedButton(
                child: Text("Donar"),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
