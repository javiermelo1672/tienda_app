import 'package:flutter/material.dart';
import 'package:tienda_app/home/home_page.dart';
import 'package:tienda_app/home/home_page_admin.dart';
import 'package:tienda_app/utils/colors_utils.dart';
import 'package:tienda_app/widgets/buttons/button_riased_gradient_widget.dart';
import 'package:tienda_app/widgets/text/text_widget.dart';

class LoginSimulatorPage extends StatefulWidget {
  @override
  _LoginSimulatorPageState createState() => _LoginSimulatorPageState();
}

class _LoginSimulatorPageState extends State<LoginSimulatorPage> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('TIENDA LA 40'),
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
      SizedBox(height: size.height * 0.35),
      RaisedGradientButton(
        gradient: LinearGradient(
          colors: <Color>[mainColor, mainColor],
        ),
        child: TextScalableWidget(
          'INICIAR EN ADMINISTARDOR',
          context: context,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePageAdmin()));
        },
      ),
      globalSizedbox,
      RaisedGradientButton(
        gradient: LinearGradient(
          colors: <Color>[green, green],
        ),
        child: TextScalableWidget(
          'INICIAR EN CLIENTE',
          context: context,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      )
    ];
  }
}
