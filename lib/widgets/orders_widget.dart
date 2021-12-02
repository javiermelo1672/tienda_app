import 'package:flutter/material.dart';
import 'package:tienda_app/utils/colors_utils.dart';

class OrdersWidget extends StatelessWidget {
  final String name;
  final String price;
  final String quantity;
  final Function ontap;

  OrdersWidget({
    @required this.name,
    @required this.price,
    @required this.quantity,
    @required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: globalRadius,
        child: Container(
          height: 150,
          color: grey.withOpacity(0.15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name ?? "Órden # 456",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        price ?? "(8) productos",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        quantity ?? "45000 COP",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        quantity ?? "25/04/2021 12:34:00",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.list),
                  onPressed: ontap ?? null,
                )
              ],
            ),
          ),
        ));
  }
}
