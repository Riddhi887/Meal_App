import 'package:flutter/material.dart';

//here we know need to manage any state so its stateless widget
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  //override build()
  @override
  Widget build(BuildContext context) {
    //return a widget
    //every multiScreen app uses a scaffold widget to build a base of the app with a widget
    return
    Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Category'),
      ),
      //to render Grid Elements on the screen 

      body: GridView(

        //controls the UI of the grid on the screen

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2  ,     //set no. of column in particular screen
          childAspectRatio: 3/2,   //set the size of that column
          crossAxisSpacing: 20,    //space between coloumn
          mainAxisSpacing: 20,
          ) ,
        children: [
          Text('1.', style: TextStyle(color: Colors.white)),
          Text('2.', style: TextStyle(color: Colors.white)),
          Text('3.', style: TextStyle(color: Colors.white)),
          Text('4.', style: TextStyle(color: Colors.white)),
          Text('5.', style: TextStyle(color: Colors.white)),
          Text('6.', style: TextStyle(color: Colors.white)),
        ],
      ), 
    );
  }
}
