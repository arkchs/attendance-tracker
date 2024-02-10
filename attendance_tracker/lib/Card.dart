import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
   CustomCard({super.key});
  List<String> s=['Optimization Techniques', 'Artificial Intelligence',
  'Design and Analysis Of Algorithms','DataBase Management Systems',
  ];
  @override
  Widget build(BuildContext context) {
    Size Screen = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: s.length,
      itemBuilder: (context,index){
        return GestureDetector(
          onTap:() {
            Navigator.pushNamed(context, 'SubjectPage');
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              
              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            elevation: 20,
            color: Colors.yellow.shade200,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[
                    Colors.white70,
                    Colors.yellow.shade100,
                    Colors.red.shade100,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,),
                ),
                height: Screen.height/5,
                child: Padding(
                  padding: const EdgeInsets.only(left:20,top: 25),
                  child: Text(s[index],style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
             
            ),
          ),
        );
      },
    );
  }
}