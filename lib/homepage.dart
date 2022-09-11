import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: completar todo lo necesario

  var radioGroup = {0: "Amazing 20%", 1: "Good 18%", 2: "Okay 15%"};
  int? currentRadio;
  bool _roundthisshitup = false;
  var _totalamount = TextEditingController();
  String _tiptext = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(
              Icons.room_service,
              color: _totalamount.text == "" ? Colors.grey : Colors.green,
            ),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: _totalamount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  labelText: "Cost of service",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.dinner_dining,
              color: currentRadio == null
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
            ),
            title: Text("How was the service?"),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: radioGroupGenerator(),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.credit_card,
            ),
            title: Text("Round up tip"),
            trailing: Switch(
              value: _roundthisshitup,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (bool value) {
                setState(() {
                  _roundthisshitup = value;
                });
              },
            ),
          ),
          Container(
            color: Colors.green,
            child: MaterialButton(
              child: Text("CALCULATE", style: TextStyle(color: Colors.white)),
              onPressed: _tipCalculation,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Tip amount: \$" + _tiptext,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _tipCalculation() {
    double tip;
    if (_totalamount.text != "" && currentRadio != null) {
      _tiptext = "";
      double actualamount = double.parse(_totalamount.text);
      if (currentRadio == 1) {
        tip = actualamount * 0.18;
        _tiptext = (_roundthisshitup == true)
            ? tip.toStringAsFixed(0)
            : tip.toStringAsFixed(2);
        setState(() {});
      } else if (currentRadio == 0) {
        tip = actualamount * 0.20;
        _tiptext = (_roundthisshitup == true)
            ? tip.toStringAsFixed(0)
            : tip.toStringAsFixed(2);
        setState(() {});
      } else if (currentRadio == 2) {
        tip = actualamount * 0.15;
        _tiptext = (_roundthisshitup == true)
            ? tip.toStringAsFixed(0)
            : tip.toStringAsFixed(2);
        setState(() {});
      }
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
            const SnackBar(content: Text("Please enter a valid amount")));
      _tiptext = "0";
      setState(() {});
    }
    // TODO: completar
  }

  radioGroupGenerator() {
    return radioGroup.entries
        .map(
          (radioElement) => ListTile(
            leading: Radio(
              value: radioElement.key,
              groupValue: currentRadio,
              activeColor: Colors.green,
              onChanged: (int? selected) {
                currentRadio = selected;
                setState(() {});
              },
            ),
            title: Text("${radioElement.value}"),
          ),
        )
        .toList();
  }
}
