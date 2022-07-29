import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  const TransactionList(
      {Key? key, required this.transactions, required this.removeTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: transactions
                .map((e) => TransactionItem(
                      key: ValueKey(e.id),
                      transaction: e,
                      removeTransaction: removeTransaction,
                    ))
                .toList(),
          );
  }
}
