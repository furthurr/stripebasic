//By Pedro Gomez @furthurr

import 'dart:convert';
import 'package:http/http.dart' as http;


class Stripe{

  Future<String> cardToken(number,yearExpiration,monthExpiration,cvc,secretKey) async{
    print("intentando generaremos el token");
    var url = 'https://api.stripe.com/v1/tokens';
    var response = await http.post(url, 
      headers:{"Authorization": "Bearer $secretKey",},
      body: {
        'card[number]':number, 
        'card[exp_month]':monthExpiration,
        'card[exp_year]':yearExpiration,
        'card[cvc]':cvc
        });
    if(response.statusCode ==200){
      var resp = json.decode(response.body);
      print('=======TOKEN=========');
      print(response.body);
      return resp['id'];
    }
    else{
      print("error en la consulta");
      return(response.body);
    }
  }
  Future<String> createCharge(token,monto,concepto,secretKey) async{
    print("intentando realizar pago");
    var url = 'https://api.stripe.com/v1/charges';
    var response = await http.post(url, 
      headers:{"Authorization": "Bearer $secretKey",},
      body: {
          'amount'      : monto,
          'currency'    : 'MXN',
          'description' : concepto,
          'source'      : token
      });
    if(response.statusCode == 200){
      var resp = json.decode(response.body);
      print('=======COBRO=========');
      print(response.body);
      return resp['id'];
    }
    else{
      print("error en la consulta");
      return(response.body);
    }
  }
}
