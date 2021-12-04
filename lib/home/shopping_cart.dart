import 'package:flutter/material.dart';
import 'package:tienda_app/services/data_post_services.dart';
import 'package:tienda_app/utils/colors_utils.dart';
import 'package:tienda_app/widgets/buttons/button_riased_gradient_widget.dart';
import 'package:tienda_app/widgets/product_widget.dart';
import 'package:tienda_app/widgets/text/text_widget.dart';

class ShoppingCarPage extends StatefulWidget {
  List<Map<String, dynamic>> shoppingOrder;
  ShoppingCarPage({@required this.shoppingOrder});
  @override
  _ShoppingCarPageState createState() => _ShoppingCarPageState();
}

class _ShoppingCarPageState extends State<ShoppingCarPage> {
  DataPostService _dataPostService = DataPostService();
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu carrito'),
        backgroundColor: green,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: _createForm(_size, context),
      )),
    );
  }

  Widget _createForm(Size size, BuildContext context) {
    final List<Widget> _listOfItems = _listOfWidgets(size, context);

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _listOfItems.length,
        itemBuilder: (context, index) {
          return _listOfItems[index];
        });
  }

  List<Widget> _listOfWidgets(Size size, BuildContext context) {
    return [
      globalSizedbox,
      widget.shoppingOrder != null
          ? Container(
              height: size.height * 0.65,
              child: ListView.builder(
                itemCount: widget.shoppingOrder.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ProductWidget(
                      name: widget.shoppingOrder[index]['name'],
                      price: widget.shoppingOrder[index]['price'].toString(),
                      quantity:
                          widget.shoppingOrder[index]['quantity'].toString(),
                      ontap: null,
                    ),
                  );
                },
              ),
            )
          : Center(child: Text('No hay productos en el carrito')),
      Row(children: [
        Text(
          "TOTAL:",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text("${getTotal()} COP",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
      ]),
      globalSizedbox,
      RaisedGradientButton(
        gradient: LinearGradient(
          colors: <Color>[green, green],
        ),
        child: TextScalableWidget(
          'ORDENAR',
          context: context,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          List _order = [];

          for (int i = 0; i < widget.shoppingOrder.length; i++) {
            Map<String, dynamic> _orderMap = {
              "product_id": 0,
              "cantidad_seleccionada": 0
            };

            _orderMap['product_id'] = widget.shoppingOrder[i]['id'];
            _orderMap['cantidad_seleccionada'] =
                widget.shoppingOrder[i]['quantity'];

            _order.add(_orderMap);
          }

          _dataPostService.addOrder(_order).then((value) {
            //Navigator.pop(context);
          });
        },
      )
    ];
  }

  getTotal() {
    int total = 0;
    for (int i = 0; i < widget.shoppingOrder.length; i++) {
      total += widget.shoppingOrder[i]['price'] *
          widget.shoppingOrder[i]['quantity'];
    }
    return total;
  }
}
