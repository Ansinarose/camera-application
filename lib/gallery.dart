import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class Gallery extends StatefulWidget {
  final List<String> Mylist;
  const Gallery({required this.Mylist});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PHOTOS'),
      ),
      body: SafeArea(
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10),itemCount:widget.Mylist.length , itemBuilder:(context, index){
          return Image.file(File(widget.Mylist[index]),
          fit: BoxFit.cover,);
        } ) ),
    );
  }
}