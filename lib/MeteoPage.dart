import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather_model.dart';

class MeteoPage extends StatefulWidget {
  const MeteoPage({super.key});

  @override
  _MeteoPageState createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  Weather? _weather;
  bool _isLoading = false;

  Future<void> fetchWeather() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Casablanca&units=metric&appid=d8c3aa922e5e11e7ef39441571b98964'));

    if (response.statusCode == 200) {
      setState(() {
        _weather = Weather.fromJson(jsonDecode(response.body));
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Météo'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _weather == null
            ? Text('Aucune donnée disponible')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather!.cityName,
              style: TextStyle(fontSize: 32),
            ),
            Text(
              '${_weather!.temperature}°C',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              _weather!.description,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchWeather,
        child: Icon(Icons.cloud),
      ),
    );
  }
}
