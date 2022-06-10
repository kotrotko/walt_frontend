import 'package:flutter/material.dart';

class WhoScreen extends StatefulWidget {
  const WhoScreen({Key? key}) : super(key: key);

  @override
  _WhoScreenState createState() => _WhoScreenState();
}

class _WhoScreenState extends State<WhoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40.0),
              Container(
                height: 60.0,
                child: Text("Who do you need?",
                style: TextStyle(color:Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 40.0),
              Container(height: 200,
                child: Image(image: AssetImage('assets/who-walt.jpeg'))
              ),
              SizedBox(height: 40.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Work with a freelancer.',
                  style: TextStyle(color: Colors.white, fontSize: 30.0,),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                  child: Text('Flexible engagements from one month to one year (or more).',
                    style: TextStyle(color:Colors.white,
                        fontSize: 16.0,),
                  ),
                ),
              SizedBox(height: 40.0),
              Container(child: Container(child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: r"$: ", style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.greenAccent,)),
                    TextSpan(text: 'Developer\u0027s monthly or hourly rate.')],
                  style: TextStyle(color:Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              )),),
              SizedBox(height: 20.0),
              Container(child: Text(r'Retain a certified Gun.io professional with flexible packages starting at $1,000/month. No long-term contract required. Gun.io keeps only 30%.',
                style: TextStyle(color:Colors.white,
                    fontSize: 16.0,),
              ),),
              SizedBox(height: 60.0),
              Container(
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text('Find a hired gun', style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          )),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.greenAccent,
                          ),
                      ],
                    ),
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(fixedSize: Size(280, 60),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.greenAccent),
                      )
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
