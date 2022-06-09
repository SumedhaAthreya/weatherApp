import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIpage extends StatefulWidget{
  const APIpage({Key? key}) : super(key: key);

  @override
  State<APIpage> createState() => _APIpageState();

}

class _APIpageState extends State<APIpage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  Text("API PAGE"),
      ),

      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: (){
              apicall();
            }, child: Text("CALL API")),

            FutureBuilder(future: apicall(), builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return Text(snapshot.data);
              }
              else{
                return CircularProgressIndicator();
              }
            }





            )
          ],
        ),
      ),
    );
  }
}


Future<String> apicall() async {
  final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=bangalore&appid=bbe38655e1f08d17b18187fd783628de");
  final response = await http.get(url);
  print(jsonDecode(response.body)["weather"][0]["description"]);
  String output = jsonDecode(response.body)["weather"][0]["description"];
  return output;
}