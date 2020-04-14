# Stripe Basic 

StripeBasic is created to make the stripe-flutter easier and simple .

## Note:


This lib has two methods:
1.- create a card token 
2.- create a charge with this token (1).




### Edit main -> /main.dart

example:
```
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
  String _secretKey           = 'sk_test_Af08tUBa....';
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
```

### Example lib -> stripe_provider.dart
[![Watch the video](https://i.imgur.com/OmFQgK9.png)](https://www.youtube.com/watch?v=SGLjtk3qvfo)

## Author

* **Pedro Gomez** - *@furthurr* - [twitter](https://twitter.com/furthurr)

 

## License

This project is licensed under Apache 2.0 - see the [LICENSE.md](LICENSE.md) file for details

## Help me

* Invite me a coffee [paypal](https://www.paypal.me/furthurr/50)
* Send a [tweet](https://twitter.com/intent/tweet?url=https%3A//github.com/furthurr/stripebasic&text=stripe%20para%20flutter.&via=furthurr&related=furthurr) 

