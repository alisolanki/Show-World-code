import 'package:ShowWorld/Free_resources/filmbudget/budget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BudgetTile extends StatefulWidget {
  final String maintitle;
  final List<String> subtitles;
  BudgetTile(this.maintitle, this.subtitles);
  @override
  _BudgetTileState createState() => _BudgetTileState();
}

class _BudgetTileState extends State<BudgetTile> {
  var _showdetails = false;
  var _subtotal = 0.0;
  Map<String, double> _initialValue;

  @override
  void initState() {
    super.initState();
    BudgetModel().budgetModel.entries.map((map) {
      map.value.forEach((_value) {
        _readData(key: "${map.key}_$_value").then(
          (v) => setState(() {
            _initialValue.update(
              "${map.key}_$_value",
              (_) => v,
              ifAbsent: () => v,
            );
          }),
        );
      });
    });
    setState(() {
      calculateSubTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _detailsCard = Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
        color: Color(0xffa9cce3),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ...widget.subtitles.map(
            (entry) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Text(
                      "$entry:",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Budget",
                        prefix: Text("Rs."),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      initialValue: '0.0',
                      onChanged: (value) => setState(() {
                        _saveData(
                          key: "${widget.maintitle}_$entry",
                          value: double.parse(value),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            borderRadius: _showdetails
                ? const BorderRadius.vertical(top: const Radius.circular(10.0))
                : const BorderRadius.all(const Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: ListTile(
            title: Text(
              "${widget.maintitle}",
              style: TextStyle(
                fontFamily: "roboto",
                fontWeight: FontWeight.bold,
                color: Color(0xff5499c7),
              ),
            ),
            subtitle: Text(
              "$_subtotal",
              style: TextStyle(
                fontFamily: "roboto",
                color: Color(0xff5499c7),
              ),
            ),
            trailing: Icon(
                _showdetails ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            dense: true,
            onTap: () {
              setState(() {
                _showdetails = !_showdetails;
              });
            },
          ),
        ),
        _showdetails ? _detailsCard : SizedBox(width: 10)
      ],
    );
  }

  Future<void> _saveData({String key, double value}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
    calculateSubTotal();
    print('saved $value at $key');
  }

  Future<double> _readData({String key}) async {
    final prefs = await SharedPreferences.getInstance();
    print('read ${prefs.getDouble(key)}');
    return prefs.getDouble(key) ?? 0.0;
  }

  void calculateSubTotal() {
    _subtotal = 0.0;
    widget.subtitles.forEach((_subtitle) {
      _readData(key: "${widget.maintitle}_$_subtitle").then((v) => setState(() {
            _subtotal += v;
          }));
    });
  }
}
