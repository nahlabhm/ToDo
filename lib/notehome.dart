


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test1/editer.dart';
import 'package:test1/models.dart';
import 'package:test1/notescreen.dart';

class HomeNote extends StatefulWidget {
  const HomeNote({super.key});

  @override
  State<HomeNote> createState() => _HomeNoteState();
}

class _HomeNoteState extends State<HomeNote> {

  Randomcolor(){
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }
    void deleteNote(int index) {
    setState(() {
      Note note = sampleNotes[index];
      sampleNotes.remove(note);
      sampleNotes.removeAt(index);
    });
  }

   void onSearchTextChanged(String searchText) {
    setState(() {
     sampleNotes=sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body:Padding(padding: EdgeInsets.all(20),
       child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Note"),
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
        TextField(
              onChanged: onSearchTextChanged,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                hintText: "Search notes...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                fillColor: Colors.grey.shade800,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          SizedBox(height: 15,),
               
             Expanded(
              child:Container(
            
              child:ListView.builder(
                itemCount: sampleNotes.length,
                itemBuilder: (BuildContext context, int index) { 
                return Padding(padding: EdgeInsets.symmetric(vertical: 4),
                child:GestureDetector(
   onTap: () async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditScreen(note: sampleNotes[index])),
  );

  if (result != null) {
    setState(() {
      int originalIndex = sampleNotes.indexOf(sampleNotes[index]);

      sampleNotes[originalIndex] = Note(
        id: sampleNotes[originalIndex].id,
        title: result[0],
        content: result[1],
        modifiedTime: DateTime.now(),
      );

      sampleNotes[index] = Note(
        id: sampleNotes[index].id,
        title: result[0],
        content: result[1],
        modifiedTime: DateTime.now(),
      );
    });
  }
},

   child: Container(
      padding: EdgeInsets.only(top:15,left: 10,bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Randomcolor(),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
       ListTile(
        title: Text(sampleNotes[index].title),
        subtitle: Text(sampleNotes[index].content),
        trailing: IconButton(icon: Icon(Icons.delete), onPressed: () { deleteNote(index); },),
        ),
        Padding(padding: EdgeInsets.only(right: 15),
        child:Text("20 Mars ,2022")
        )   

      ],)
   )
    )
                );
               },
                
              )
             ))
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () async {
    final result = await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (context) {
        return const EditScreen();
      },
    );

    if (result != null) {
      setState(() {
        sampleNotes.add(Note(
          id: sampleNotes.length,
          title: result[0],
          content: result[1],
          modifiedTime: DateTime.now(),
        ));
      });
    }
  },


       backgroundColor: Colors.black,
      shape: CircleBorder(),
      child:Center(
      child:IconButton(icon: Icon(Icons.add,color: Colors.white,), onPressed: () {  },)
      )
      ),

    );
  }
}


