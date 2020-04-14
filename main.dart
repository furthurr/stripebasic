import 'package:appname/stripe_provider.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _stripe                 = new Stripe();
  String _token               = 'Sin token';
  String _numberCard          = '4000056655665556';
  String _cardMonthExpiration = '12';
  String _cardYearExpiration  = '2024';
  String _cardCvc             = '123';
  String _idCharge            = 'Primero necesitas generar un token';
  String _secretKey           = 'sk_test_Af08tUBa....';//<-- your secretKey
  String _monto               = '5000000';
  String _concepto            = 'Invite me a coffee @furthurr https://www.paypal.me/furthurr/50';

  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      title: 'Simple Stripe @furthurr',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Stripe @furthurr'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('card: $_numberCard'),
              Text('month_expiration: $_cardMonthExpiration'),
              Text('year_expiration: $_cardYearExpiration'),
              Text('cvc: $_cardCvc'),
              RaisedButton(onPressed: getToken,
              child: Text('generar token'),),
              Text('token: $_token'),
              RaisedButton(onPressed: setCharge,
              child: Text('Generar pago'),),
              Text('Id de cobro: $_idCharge')
            ],
          ),
        ),
      ),
    ); 
  }
  void getToken() {
      _stripe.cardToken(_numberCard,_cardYearExpiration,_cardMonthExpiration,_cardCvc,_secretKey).then((data){
        setState(() {
          _token = data;            
        });
      });
  }
  void setCharge(){
    if (_token=='Sin token'){print('no puedes realizar pago');}
    else{
      _stripe.createCharge(_token,_monto,_concepto,_secretKey).then((data){
        setState(() {          
          _idCharge = data;
        });
      });
    }
  }
}
