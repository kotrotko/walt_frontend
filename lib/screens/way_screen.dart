import 'package:flutter/material.dart';

class WayScreen extends StatefulWidget {
  const WayScreen({Key? key}) : super(key: key);

  @override
  _WayScreenState createState() => _WayScreenState();
}

class _WayScreenState extends State<WayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Container(
                height: 60.0,
                child: Text("The Walt way",
                  style: TextStyle(color:Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Walt matches exceptional companies with exceptional, remote software developers.',
                  style: TextStyle(color:Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 20.0),
              Container(child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Clients'),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(Icons.favorite, color: Colors.greenAccent,),
                      ),
                    ),
                    TextSpan(text: 'us for our vetted pool of talent, simple process, and fast turnaround.')],
                  style: TextStyle(color:Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              )),
              SizedBox(height: 20.0),
              Container(child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Job seekers'),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(Icons.favorite, color: Colors.greenAccent,),
                      ),
                    ),
                    TextSpan(text: 'us because we match our exclusive network with vetted opportunities and make getting hired simple.')],
                style: TextStyle(color:Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(child: Text('Get started',
                    style: TextStyle(color:Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  )),
                  Container(child: IconButton(
                    icon: Icon(Icons.arrow_forward,
                    color: Colors.greenAccent),
                    onPressed: (){},
                  )
                  ),]
              ),
              SizedBox(height: 20.0),
              Container(
                height: 300,
                child: ShaderMask(
                  blendMode: BlendMode.screen,
                  shaderCallback: (rect) => RadialGradient(
                    radius: 0.9,
                    colors: [
                      Colors.black,
                      Colors.white,
                    ]
                  ).createShader(rect.translate(50, -20)),
                    child: Image(image: AssetImage('assets/jessie-pinkman.jpeg'))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
