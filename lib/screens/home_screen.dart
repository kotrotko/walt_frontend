import 'package:flutter/material.dart';

import 'package:gunio/ui/widgets/auth/login/form.dart';
//import 'package:gunio/ui/widgets/auth/register/register_email_screen.dart';
//import 'package:gunio/ui/widgets/auth/register/complete_form.dart';
import 'package:gunio/ui/widgets/auth/register/form.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> dropdownValue = ['Hire a developer', 'Walt talent', 'How Walt works', 'Get hired', "Login"];
  String selectedDropdownValue = 'Hire a developer';

  void onSelected(BuildContext context, int item){
    switch(item){
      case 0:
        print('Hire a developer');
        break;
      case 1:
        print('Walt talent');
        break;
      case 2:
        print('How Walt works');
        break;
      case 3:
        print('Get hired');
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => LoginForm()),
        );
        break;
      case 5:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginForm()),
          (route) => false,
        );
    }
  }

  // void logIn(BuildContext context, int item){
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => LoginForm()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('assets/walter.png',
              scale: 12
          ),
        ),
        title: const Text ("Walt"),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme().apply(bodyColor: Colors.white),
            ),
            // child: DropdownButtonHideUnderline(
            //   child: DropdownButton<String>(
            //     icon: Icon(Icons.menu),
            //     value: selectedDropdownValue,
            //     items: dropdownValue
            //       .map((item) => DropdownMenuItem<String>(
            //         value: item,
            //         child: Text(item, style: TextStyle(color: Colors.black))))
            //       .toList(),
            //     onChanged: (item) => setState(() => selectedDropdownValue = item!),
            //     ),
            // ),
            // ),

            child: PopupMenuButton<int>(
              color: Theme.of(context).colorScheme.secondary,
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Text('Hire a developer', style: TextStyle(color: Colors.white,),),),
                PopupMenuItem(
                  value: 1,
                  child: Text('Walt talent', style: TextStyle(color: Colors.white,),),),
                PopupMenuItem(
                  value: 2,
                  child: Text('How Walt works', style: TextStyle(color: Colors.white,),),),
                PopupMenuItem(
                  value: 3,
                  child: Text('Get hired', style: TextStyle(color: Colors.white,),),),
                PopupMenuItem(
                  value: 4,
                  child: Text('Log in', style: TextStyle(color: Colors.white,),),),
                PopupMenuDivider(),
                PopupMenuItem(
                  value: 5,
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.white),
                      const SizedBox(width: 8),
                      Text('Log out', style: TextStyle(color: Colors.white,),),
                    ],
                  ),),
              ],
            ),),
          TextButton(
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(
                  //MaterialPageRoute(builder: (context) => CompleteRegisterForm()),
                  MaterialPageRoute(builder: (context) => RegisterForm()),
                      (route) => false,
                );
              },
              child: Text("Test", style: TextStyle(color: Colors.yellow))),
        ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
              SizedBox(height: 40.0),
              Container(
                color: Colors.black,
                child: Image(image: AssetImage('assets/breaking-bad.jpeg'))
              ),
              SizedBox(height: 20.0),
              Container(
                    color: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 140.0,
                    child: Text('Kyrgyzstan-class technical talent, on tap',
                      style: Theme.of(context).textTheme.headline1
                      // style: TextStyle(color:Colors.white,
                      //     fontSize: 40.0,
                      //     fontWeight: FontWeight.bold),
                    )
              ),
              SizedBox(height: 20.0),
              Container (
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Walt helps companies scale their software engineering teams seamlessly with our global network of elite hired guns.',
                  style: TextStyle(color: Colors.white, fontSize: 20.0,),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(height: 140,
                          color: Colors.black,
                      child: Stack(alignment: Alignment.centerRight,
                          children: [Positioned(bottom: 20,
                                  left: 20,
                                  width: 150,
                                  height: 80,
                            child: ElevatedButton(
                              child: Column(
                                children: [
                                  Padding(
                                        padding: const EdgeInsets.only
                                            (top: 12.0,
                                              left: 10.0),
                                          child: Text('Hire someone',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              )
                                          ),
                                        ),
                                  Icon(Icons.arrow_forward,
                                            color: Colors.black
                                        ),],
                                    ),
                                    onPressed: () => {},
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(RoundedRectangleBorder
                                              (borderRadius: BorderRadius.circular(40.0),
                                            )
                                        )
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Positioned(bottom: 25,
                                    left: 140,
                                    height: 70,
                                    child: ElevatedButton(child:
                                      Column(children: [
                                        Padding(padding: const EdgeInsets.only(top: 10.0),
                                          child: Text('Find work',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            )
                                        ),),
                                        Icon(Icons.arrow_forward)],),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>
                                            (RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(35.0),
                                                side: BorderSide(color: Colors.greenAccent),
                                              ))
                                      ),),
                                  ),
                                ),]),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
    );
  }
}