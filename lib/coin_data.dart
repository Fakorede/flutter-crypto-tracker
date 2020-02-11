import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '51C2961D-27EB-417A-8942-0834B8F22688';

class CoinData {
  Future getCoinData(String fiat, String crypto) async {
    String requestURL = '$coinAPIURL/$crypto/$fiat?apikey=$apiKey';
    http.Response response = await http.get(requestURL);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData['rate']);
      return decodedData['rate'];
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
