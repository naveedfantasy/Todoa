import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = "";
  List<dynamic> lst = [1,2,3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context,index){
          return Container(
            height: 50,
              color: Colors.purple,
            margin: EdgeInsets.all(3),
            child: ListTile(
              title: Text("${lst[index]}", style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 30), ),
              trailing: Container(
                width: 50,
                child: Row(
                  children: [
                    GestureDetector(onTap:(){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Edit Item",style: TextStyle(color: Colors.purple),),
                          content: TextField(
                            onChanged: (value){
                              output = value;
                            },
                          ),
                          actions: [
                            ElevatedButton(onPressed: (){
                              Navigator.of(context).pop();
                              setState(() {
                                lst.replaceRange(index, index+1, {output});
                              });
                            }, style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.purple),
                                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),

                                child: Text("Save"))
                          ],
                        );

                      });
                    },child: Icon(Icons.edit,
                    color: Colors.white,),
                    ),
                    GestureDetector(onTap:(){
                      setState(() {
                        lst.removeAt(index);
                      });
                    },child: Icon(Icons.delete,
                      color: Colors.white,)),
                  ],
                ),
              ),
            ),
          );

    }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Add Item",style: TextStyle(color: Colors.purple), ),
            content: TextField(
              onChanged: (value){
                output = value;
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: (){
                Navigator.of(context).pop();
                setState(() {
                  lst.add(output);
                });
              }, style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),

                  child: Text("Add"))
            ],
          );

        });
      },child: Text("Add"),),

    );
  }
}
