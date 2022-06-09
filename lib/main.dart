// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_this

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';



void main() => runApp(
  const MaterialApp(
    title: "Weather App",
    home: Home(),
  )
);

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}

class _HomeState extends State<Home>{

  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  Future getWeather () async{
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Bengaluru&appid=bbe38655e1f08d17b18187fd783628de'));
    var results = jsonDecode(response.body);
    setState((){
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState(){
    super.initState();
    this.getWeather();
  }


  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                  "Currently in Bangalore",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
                Text(
                  temp != null ? temp.toString() + "\u00B0": "Loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "Loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.temperatureHalf),
                      title: const Text("Temperature"),
                      trailing: Text(temp != null ? "$temp\u00B0" : "Loading"),
                    ),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.cloud),
                      title: const Text("Weather"),
                      trailing: Text(description != null ? humidity.toString(): "Loading"),
                    ),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.sun),
                      title: const Text("Humidity"),
                      trailing: Text(humidity != null ? humidity.toString(): "Loading"),
                    ),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.wind),
                      title: const Text("Wind Speed"),
                      trailing: Text(windSpeed != null ? windSpeed.toString() : "Loading"),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

