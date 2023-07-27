import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shop_app/providers/orders.dart' as od;

class OrderItem extends StatefulWidget {
  final od.OrderItem order;

  const OrderItem({
    super.key,
    required this.order,
  });

  @override
  State<OrderItem> createState() => _OrderItemState();
}

// class _OrderItemState extends State<OrderItem> {
//   var _expanded = false;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 1300),
//       height:
//           _expanded ? min(widget.order.products.length * 20.0 + 110, 200) : 95,
//       child: Card(
//         margin: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text('\$${widget.order.amount}'),
//               subtitle: Text(
//                 DateFormat('dd/MM/yyyy  hh:mm').format(widget.order.dateTime),
//               ),
//               trailing: IconButton(
//                 icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
//                 onPressed: () {
//                   setState(() {
//                     _expanded = !_expanded;
//                   });
//                 },
//               ),
//             ),
//             //if (_expanded)
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 1300),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15,
//                   vertical: 4,
//                 ),
//                 height: _expanded
//                     ? min(widget.order.products.length * 20.0 + 10, 200)
//                     : 0,
//                 child: ListView(
//                   children: [
//                     ...widget.order.products
//                         .map((ord) => Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   ord.title,
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${ord.quantity} x \$${ord.price}',
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ))
//                         .toList(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _expanded
              ? min(widget.order.products.length * 20.0 + 110,
                  constraints.maxHeight)
              : 95,
          child: Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Text('\$${widget.order.amount}'),
                  subtitle: Text(
                    DateFormat('dd/MM/yyyy  hh:mm')
                        .format(widget.order.dateTime),
                  ),
                  trailing: IconButton(
                    icon:
                        Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _expanded = !_expanded;
                      });
                    },
                  ),
                ),
                //if (_expanded)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _expanded
                      ? min(widget.order.products.length * 20.0 + 10,
                          constraints.maxHeight - 95)
                      : 0,
                  child: ListView(
                    children: [
                      ...widget.order.products
                          .map((ord) => Container(
                                margin:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ord.title,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${ord.quantity} x \$${ord.price}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ],
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
