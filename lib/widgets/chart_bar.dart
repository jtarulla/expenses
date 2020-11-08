import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendigPercentageOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendigPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    final today = (DateFormat.E().format(DateTime.now()).substring(0, 2));

    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: LayoutBuilder(builder: (context, constrains) {
        return Column(
          children: <Widget>[
            Container(
                height: constrains.maxHeight * 0.15,
                child: FittedBox(
                    child: Text(spendingAmount > 1000
                        ? '€${(spendingAmount / 1000).toStringAsFixed(1)}k'
                        : '€${spendingAmount.toStringAsFixed(1)}'))),
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
            Container(
                height: constrains.maxHeight * 0.55,
                width: 10,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          color: Color.fromRGBO(220, 220, 220, 0.8),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    FractionallySizedBox(
                      heightFactor: spendigPercentageOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: constrains.maxHeight * 0.05,
            ),
            Container(
              height: constrains.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  label,
                  style: TextStyle(
                      fontWeight:
                          label == today ? FontWeight.bold : FontWeight.normal),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
