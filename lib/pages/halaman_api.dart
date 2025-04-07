import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class HalamanAPI extends StatefulWidget {
  const HalamanAPI({Key? key}) : super(key: key);

  @override
  State<HalamanAPI> createState() => _HalamanAPIState();
}

class _HalamanAPIState extends State<HalamanAPI> {
  final String apiKey = '14a0dceeaa62d9ffa5d91018898f5517';
  final String city = 'Jakarta';

  Future<WeatherModel> fetchWeather() async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=Jakarta&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      throw Exception('Gagal ambil data cuaca');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          'Weather',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 4.0,
                color: Colors.black26,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.blueGrey),
      ),

      body: FutureBuilder<WeatherModel>(
        future: fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("Data tidak tersedia"));
          }

          final weather = snapshot.data!;

          return Center(
            child: Card(
              margin: const EdgeInsets.all(20),
              color: Colors.white.withOpacity(0.7),
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(weather.cityName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Image.network('https://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                    Text('${weather.temperature}°C', style: const TextStyle(fontSize: 36)),
                    Text(weather.description.toUpperCase(), style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
