import 'package:flutter/material.dart';
import 'package:tienda_app/home/shopping_cart.dart';
import 'package:tienda_app/services/data_get_services.dart';
import 'package:tienda_app/utils/colors_utils.dart';
import 'package:tienda_app/widgets/buttons/button_riased_gradient_widget.dart';
import 'package:tienda_app/widgets/product_widget.dart';
import 'package:tienda_app/widgets/text/text_widget.dart';
import 'package:tienda_app/widgets/textinputs/text_field_widget.dart';

class InventaryPage extends StatefulWidget {
  @override
  _InventaryPageState createState() => _InventaryPageState();
}

class _InventaryPageState extends State<InventaryPage> {
  DataGetServices _dataGetServices = DataGetServices();
  List<dynamic> _data;

  String _nombre = "";
  String _descripcion = "";
  String _precio = "";
  String _cantidad = "";

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
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
      GlobalInputtextField(
        obscure: false,
        onChanged: (value) {
          setState(() {
            _nombre = value;
          });
        },
        text: 'Nombre',
        textinputType: TextInputType.text,
        textStyle: null,
      ),
      globalSizedbox,
      GlobalInputtextField(
        obscure: false,
        onChanged: (value) {
          setState(() {
            _descripcion = value;
          });
        },
        text: 'Descripción',
        textinputType: TextInputType.text,
        textStyle: null,
      ),
      globalSizedbox,
      GlobalInputtextField(
        obscure: false,
        onChanged: (value) {
          setState(() {
            _cantidad = value;
          });
        },
        text: 'Cantidad',
        textinputType: TextInputType.phone,
        textStyle: null,
      ),
      globalSizedbox,
      GlobalInputtextField(
        obscure: false,
        onChanged: (value) {
          setState(() {
            _precio = value;
          });
        },
        text: 'Precio',
        textinputType: TextInputType.phone,
        textStyle: null,
      ),
      globalSizedbox,
      RaisedGradientButton(
        gradient: LinearGradient(
          colors: _nombre.isNotEmpty &&
                  _descripcion.isNotEmpty &&
                  _cantidad.isNotEmpty &&
                  _precio.isNotEmpty
              ? <Color>[mainColor, mainColor]
              : <Color>[Colors.grey, Colors.grey],
        ),
        child: TextScalableWidget(
          'AÑADIR PRODUCTO',
          context: context,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: _nombre.isNotEmpty &&
                _descripcion.isNotEmpty &&
                _cantidad.isNotEmpty &&
                _precio.isNotEmpty
            ? () {}
            : null,
      ),
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
                          child: ProductWidget(
                            name: _data[index]['nombre'],
                            price: _data[index]['valor'].toString(),
                            quantity: _data[index]['cantidad'].toString(),
                            ontap: null,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text("No tienes trabajos en curso"),
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
