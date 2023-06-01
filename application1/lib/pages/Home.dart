import 'dart:async';
import 'dart:convert';
import 'package:application1/pages/login.dart';
import 'chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';


class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> predictedSales = [];


  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _xcontroller = TextEditingController();
  final TextEditingController _ycontroller = TextEditingController();
  final TextEditingController openController = TextEditingController();
  final TextEditingController promoController = TextEditingController();
  final TextEditingController holidayController = TextEditingController();
  final TextEditingController storeTypeController = TextEditingController();
  final TextEditingController competitionDistanceController = TextEditingController();

    Future<List> predictSales() async {
    final url = 'http://10.0.2.2:5000/predict';
    final body = {
      'Store': int.parse(_xcontroller.text),
      'DayOfWeek': int.parse(_ycontroller.text),
      'Open': double.parse(openController.text),
      'Promo': int.parse(promoController.text),
      'SchoolHoliday': int.parse(holidayController.text),
      'StoreType': storeTypeController.text,
      'CompetitionDistance': double.parse(competitionDistanceController.text),
    };
    final dio = Dio();
    final response = await dio.post(
      url,
      data: body,
    );
    if (response.statusCode == 200) {
      Map jsonResponse = response.data;
      print(jsonResponse);
      setState(() {
         predictedSales = jsonResponse['predicted_sales'].map((e) => e.toDouble()).toList();
      });
    }
    return predictedSales;
  }



  Widget buildx() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Store ID',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _xcontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Enter Store ID',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
            onSaved: (value) {
              _xcontroller.text = value!;
            },
          ),
        )
      ],
    );
  }

  Widget buildly() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Days of weak',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _ycontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Enter Day of Week (1-7)',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
            onSaved: (value) {
              _ycontroller.text = value!;
            },
          ),
        )
      ],
    );
  }

  Widget buildlopen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Open Status',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: openController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Enter Open Status (0 or 1)',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
            onSaved: (value) {
              openController.text = value!;
            },
          ),
        )
      ],
    );
  }

  Widget buildlpromo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Promo Status',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: promoController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Enter Promo Status (0 or 1)',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
            onSaved: (value) {
              promoController.text = value!;
            },
          ),
        )
      ],
    );
  }

  Widget buildlsholiday() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'School Holiday Status',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: holidayController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Enter School Holiday Status (0 or 1)',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
            onSaved: (value) {
              holidayController.text = value!;
            },
          ),
        )
      ],
    );
  }

  Widget buildlstype() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Store Type',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: storeTypeController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.text,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Enter Store Type',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
            onSaved: (value) {
              storeTypeController.text = value!;
            },
          ),
        )
      ],
    );
  }

  Widget buildldistance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Competition Distance',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: competitionDistanceController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
            ],
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Enter Competition Distance',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
            onSaved: (value) {
              competitionDistanceController.text = value!;
            },
          ),
        )
      ],
    );
  }

  Widget builddoneBtn(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          predictSales().then((predictedSales) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 5),
              content: Text(
                'Predicted Sales: $predictedSales',
                style: TextStyle(fontSize: 20),
              ),
            ));
          }
          );

        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
        ),
        child: Text(
          'Show Result',
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black26,
        height: 60,
        items: <Widget>[
          Icon(Icons.logout_sharp, size: 30),
          Icon(Icons.refresh, size: 30),
          Icon(Icons.bar_chart, size: 30),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Login();
              }));
              break;
            case 1:
              _xcontroller.clear();
              _ycontroller.clear();
              openController.clear();
              promoController.clear();
              holidayController.clear();
              storeTypeController.clear();
              competitionDistanceController.clear();
              break;
            case 2:
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ChartWidget(data: [
                   predictedSales[0]
                  ,predictedSales[1]
                  ,predictedSales[2]
                  ,predictedSales[3]
                  ,predictedSales[4]
                  ,predictedSales[5]
                  ,predictedSales[6]]);
              }));
              break;
          }
        },
      ),
      backgroundColor: Colors.lightBlue,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x668AB6F9),
                      Color(0x99C13979),
                      Color(0xcc5C2C90),
                      Color(0xff2A2E74),
                    ])),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 25,
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/7.png',
                          height: 180,
                          width: 180,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildx(),
                        SizedBox(height: 10),
                        buildly(),
                        SizedBox(height: 10),
                        buildlopen(),
                        SizedBox(height: 10),
                        buildlpromo(),
                        SizedBox(height: 10),
                        buildlsholiday(),
                        SizedBox(height: 10),
                        buildlstype(),
                        SizedBox(height: 10),
                        buildldistance(),
                        SizedBox(height: 10),
                        builddoneBtn(context),
                        SizedBox(height: 10),
                       // buildchart(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
