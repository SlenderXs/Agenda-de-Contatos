import 'dart:io';

import 'package:agendadecontatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ContactHelper helper = ContactHelper();

  List<Contact> contacts = [];


  @override
  void initState() {
    super.initState();

    helper.getAllContacts().then((list){
      setState(() {
        contacts = [];
      });

    });
  }

  /*@override
  void initState() {
    super.initState();

    Contact c = Contact();
    c.name = "Kaique";
    c.phone = "31992708354";
    c.email = "kaiqueicaro32@gmail.com";
    c.img = "imgtest";

    helper.saveContact(c);

    helper.getAllContacts().then((list) {
      print(list);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
          itemCount: contacts.length,
          itemBuilder: (context, index){
          return _contactCard(context, index);


          }



      ),
    );
  }

  Widget  _contactCard(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children:<Widget> [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: contacts[index].img !="" ?
                     FileImage(File(contacts[index].img)): 
                        AssetImage("imagens/contato.png") as ImageProvider


                  )

                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text( contacts[index].name ,
                      style: TextStyle(fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                      ),
                      Text( contacts[index].email,
                        style: TextStyle(fontSize: 18.0,
                               ),
                      ),
                      Text( contacts[index].phone,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );

  }

}
