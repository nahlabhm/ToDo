

import 'package:flutter/material.dart';
import 'package:test1/models.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key,  this.note });
  final Note? note;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  
 TextEditingController _titlecontroller =TextEditingController();
  TextEditingController _contentcontroller =TextEditingController();
 
 @override
 void initState() {
  if(widget.note!=null){
    _titlecontroller=TextEditingController(text: widget.note!.title);
    _contentcontroller=TextEditingController(text: widget.note!.content);

  }
   super.initState();
   
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Padding(padding: EdgeInsets.all(20),
       child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Center(
                  child: Icon(Icons.search,color: Colors.white,),
                )
              )
            ],
          ),
                    SizedBox(height: 20,),

            TextFormField(
              controller: _titlecontroller,
            decoration: InputDecoration(
              hintText: "name",
              isDense: true,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blueAccent)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blueAccent)
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _contentcontroller,
            maxLines: 5,
      
            decoration: InputDecoration(
              hintText: "Content",
              isDense: true,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blueAccent)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blueAccent)
              ),
            ),

          ),
                    SizedBox(height: 10,),
            
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 1, 154, 231),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
           ),
          onPressed: (){
            Navigator.pop(context,[_titlecontroller.text,_contentcontroller.text]);
          }, child: Center(
          child: Text("Add",style: TextStyle(color: Colors.white),),
        ))
        ]
       )
       )
    );
  }
}