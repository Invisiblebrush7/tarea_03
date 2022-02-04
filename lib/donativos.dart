import 'package:flutter/material.dart';

class Donativos extends StatefulWidget {
  Donativos({Key? key, required this.donativos}) : super(key: key);

  final Map<String, double> donativos;

  @override
  State<Donativos> createState() => _DonativosState();
}

class _DonativosState extends State<Donativos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donativos Obtenidos"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset('images/paypal.png'),
              trailing: Text(
                "0.0",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            SizedBox(height: 24.0),
            ListTile(
              leading: Image.asset('images/credit_card.png'),
              trailing: Text(
                "${widget.donativos["paypal"] ?? 0.0}",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            SizedBox(height: 24.0),
            Divider(thickness: 3.0, indent: 20.0, endIndent: 20.0),
            ListTile(
              leading: Icon(Icons.attach_money, size: 64.0),
              trailing: Text(
                "${widget.donativos["paypal"] ?? 0.0}",
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
