import 'package:flutter/material.dart';

class CurrencyConversionPage extends StatefulWidget {
  const CurrencyConversionPage({Key? key}) : super(key: key);

  @override
  _CurrencyConversionPageState createState() => _CurrencyConversionPageState();
}

class _CurrencyConversionPageState extends State<CurrencyConversionPage> {
  TextEditingController _amountController = TextEditingController();
  double _result = 0.0;
  String _selectedCurrency = 'USD'; // Default currency

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah'),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedCurrency,
              items: ['USD', 'EUR', 'GBP', 'JPY'] // Add more currencies as needed
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCurrency = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _convertCurrency();
              },
              child: Text('Konversi'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Hasil: $_result $_selectedCurrency',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  void _convertCurrency() {
    double amount = double.tryParse(_amountController.text) ?? 0.0;
    double exchangeRate = _getExchangeRate(_selectedCurrency);

    setState(() {
      _result = amount * exchangeRate;
    });
  }

  // You would typically get the exchange rate from an API
  double _getExchangeRate(String currency) {
    // For simplicity, using hardcoded exchange rates.
    // Replace this with actual API call or use a currency conversion library.
    switch (currency) {
      case 'USD':
        return 1.0;
      case 'EUR':
        return 0.85;
      case 'GBP':
        return 0.73;
      case 'JPY':
        return 110.0;
      default:
        return 1.0;
    }
  }
}
