import 'package:flutter/material.dart';
import 'package:tienda_app/home/shopping_cart.dart';
import 'package:tienda_app/services/data_get_services.dart';
import 'package:tienda_app/utils/colors_utils.dart';
import 'package:tienda_app/widgets/buttons/button_riased_gradient_widget.dart';
import 'package:tienda_app/widgets/orders_widget.dart';
import 'package:tienda_app/widgets/product_widget.dart';
import 'package:tienda_app/widgets/text/text_widget.dart';

class AdminOrdersPage extends StatefulWidget {
  @override
  _AdminOrdersPageState createState() => _AdminOrdersPageState();
}

class _AdminOrdersPageState extends State<AdminOrdersPage> {
  DataGetServices _dataGetServices = DataGetServices();
  List<dynamic> _data;
  Map<String, dynamic> _dataMap = {
    "id": -1,
    "name": "",
    "price": "",
    "quantity": -1
  };
  List<Map<String, dynamic>> _shoppingOrder = [];
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Órdenes'),
        backgroundColor: mainColor,
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
      RefreshIndicator(
        onRefresh: () async {
          _data = await _dataGetServices.getProducts();
          setState(() {});
        },
        color: Colors.black,
        child: FutureBuilder(
            future: _dataGetServices.getProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                _data = snapshot.data;
                if (_data.length != 0) {
                  return Container(
                    height: size.height * 0.8,
                    child: ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: OrdersWidget(),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text("No tienes órdenes en curso"),
                  );
                }
              } else {
                return Container(
                    height: size.height * 0.8,
                    child: Center(child: CircularProgressIndicator()));
              }
            }),
      )
    ];
  }
}
