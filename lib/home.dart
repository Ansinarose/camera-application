//import 'dart:html';

//import 'package:camera_app/gallery.dart';
import 'package:camera_app/gallery.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  String? imagepath;
  List<String> storage = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/homepage.jpg'),
              fit: BoxFit.cover),
                   ),
                   child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 30,),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:180.0,left: 50),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(image: AssetImage('images/camera.jpg'),
                                      fit: BoxFit.cover)
                                    ),
                                    height: 65,
                                    width: 65,
                                    child: InkWell(
                                      onTap: () {
                                        _getImage();
                                      },
                                    ),
                                    
                                  ),
                                ),
                                const Text('Camera')
                              ],
                            ),
                            const SizedBox(width: 100,),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:180.0),
                                  child: Container(
                                     decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(image: AssetImage('images/gallery.png'))
                                    ),
                                    height: 65,
                                    width: 65,
                                   child: InkWell(onTap: () {
                                  
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Gallery(Mylist: storage)));
                                   },),
                                  ),
                                ),
                                const Text('Gallery'),
                              ],
                            ),
                             ],
                        ),
                      
                      ],
                    ),
                   ),
                   
                   
                   
                   ),
      
                   
          ),
    );
  }
  Future _getImage() async{
    final selectImage = 
    await ImagePicker().pickImage(source: ImageSource.camera);
    if(selectImage != null){
      setState(() {
        print('storing...');
        imagepath = (selectImage.path);
        storage.add(imagepath!);
        print(storage.length);
      });
    }
  }
}