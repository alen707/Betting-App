//import 'package:betting_mobile_app/provider/new_name_provider.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class UserPopUp extends StatelessWidget {
  final TextEditingController nameController= TextEditingController();
   UserPopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        showDialog(context: context,
         builder: (BuildContext context){
          return AlertDialog(
            title:Text("Change User Name") ,
            content: TextField(
              controller:nameController ,
              decoration: InputDecoration(
                labelText: "New Name" ,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 10)
                )
              ),
            ),
            actions: [
              TextButton(
                onPressed:(){
                  // Provider.of<NewName>(context, listen: false)
                  // .add(nameController.text);

                  Navigator.of(context).pop();
                },
                 child: Text("submit")
                 )
            ],

          );

         }
         );
      },
       child: Text("+")
       );
  }
}