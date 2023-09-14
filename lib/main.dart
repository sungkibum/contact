import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp()
    )
  );
}



class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var total = 3;
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];
  addOne() {
    setState(() {
      total++;
    });
  }
  addName(a) {
    setState(() {
      name.add(a);
    });
  }
  @override
  build(context) {
    return Scaffold(
          appBar: AppBar(title: Text(total.toString()),),
          body: ListView.builder(
              itemCount: name.length,
              itemBuilder: (c, i){
            return ListTile(
              leading: Image.asset('profile.jpeg', width: 100,),
              title: Text(name[i]),
            );
          }),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
      showDialog(context: context, builder: (context){
        return DialogUI(addOne : addOne, addName: addName);
      });
    },
    ),
          );





  }
}




class finish extends StatelessWidget {
  const finish({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.call),
            Icon(Icons.list),
            Icon(Icons.document_scanner),
          ],
        )
    );
  }
}
class DialogUI extends StatelessWidget {
  DialogUI({super.key, this.addOne, this.addName});
  final addOne;
  var inputData = TextEditingController();
  final addName;

  @override
  Widget build(BuildContext context) {
    return (Dialog(
    child:
    Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 100,
          child:
          Column(children: [
            TextButton(child: Text('완료'),
              onPressed: (){
              addName(inputData.text);
              addOne();
              Navigator.pop(context);
              },),
            TextButton(onPressed: (){
              Navigator.pop(context);}, child: Text('취소'))
          ]),
        ),
        body: TextField(controller: inputData,),
        appBar: AppBar(title: Text('Contact'),

        ))));
  }
}




