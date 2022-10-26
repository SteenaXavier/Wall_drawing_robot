// Welcome Again to The Complete (FREE) Flutter Course
// Presented by, Ovidius Mazuru
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wall/utilities/buttons.dart';
import "dart:io";
import 'package:wall/utilities/colors.dart';
import 'package:wall/utilities/constants.dart';
import '../utilities/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: appBar(),
      ),
      backgroundColor: myColors[PRIMARY],
      body: Body(),
    );
  }
}


class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagetem = File(image.path);
      setState(() => this.image = imagetem);
    } on PlatformException catch (e) {
      print('failed:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: myColors[WHITE],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                image != null
                    ? Image.file(
                        image!,
                        width: 300,
                        height: 300,
                      )
                    : const FlutterLogo(
                        size: 260,
                      ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              const SizedBox(
                width: 15,
                height: 30,
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Stack(
                    children: [
                      Positioned(
                        // right: 15,
                        child: Container(
                          height: constraints.maxHeight * 0.8,
                          width: 400,
                          decoration: BoxDecoration(
                            color: myColors[WHITE],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 30),
                              CustomWidget(label: "Upload", onPressed: (() =>
                                    pickImage(ImageSource.gallery)) ),
                              FloatingActionButton.extended(
                                onPressed: (() =>
                                    pickImage(ImageSource.gallery)),
                                icon: const Icon(
                                  Icons.file_upload,
                                  color: Color.fromARGB(255, 247, 170, 132),
                                ),
                                label: const Text(
                                  "Upload",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 247, 170, 132)),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(0, 255, 255, 255),
                                hoverColor: const Color.fromARGB(255, 247, 170, 132),
                              ),
                              const SizedBox(width: 10),
                            
                              FloatingActionButton.extended(
                                onPressed: (() =>
                                    pickImage(ImageSource.camera)),
                                icon: const Icon(
                                  Icons.camera,
                                  color: Color.fromARGB(255, 247, 170, 132),
                                ),
                                label: const Text(
                                  "Capture",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 247, 170, 132)),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(0, 255, 255, 255),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        child: Container(
                          height: constraints.maxHeight * 0.8,
                          width: constraints.maxWidth * 0.84,
                          child: Row(
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.8,
                                width: constraints.maxWidth * .24,
                              ),
                              const SizedBox(width: 15),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({
    required this.addCallback,
  });

  final Function addCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addCallback,
      child: Container(
        decoration: BoxDecoration(
          color: myColors[SECONDARY],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            Icons.add,
            color: myColors[PRIMARY],
            size: 15,
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.favoriteCallback,
  });

  final Function favoriteCallback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => favoriteCallback,
      icon: Icon(
        Icons.favorite_border,
        color: myColors[PRIMARY],
        size: 25,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagetem = File(image.path);
      setState(() => this.image = imagetem);
    } on PlatformException catch (e) {
      print('failed:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                extendedSizeConstraints:
                    BoxConstraints.tightFor(width: 100, height: 60))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 30),
            FloatingActionButton.extended(
              onPressed: (() => pickImage(ImageSource.gallery)),
              icon: const Icon(
                Icons.file_upload,
                color: Color.fromARGB(255, 247, 170, 132),
              ),
              label: const Text(
                "Upload ",
                style: TextStyle(color: Color.fromARGB(255, 247, 170, 132)),
              ),
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              hoverColor: const Color.fromARGB(255, 247, 170, 132),
            ),
            const SizedBox(width: 10),
            FloatingActionButton.extended(
              onPressed: (() => pickImage(ImageSource.camera)),
              icon: const Icon(
                Icons.camera,
                color: Color.fromARGB(255, 247, 170, 132),
              ),
              label: const Text(
                "take ",
                style: TextStyle(color: Color.fromARGB(255, 247, 170, 132)),
              ),
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: thirdcolor,
        shadowColor: const Color.fromARGB(0, 255, 255, 255),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              secondcolor,
              thirdcolor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              Expanded(
                child: image != null
                    ? Image.file(
                        image!,
                        height: 100,
                        width: 300,
                      )
                    : const FlutterLogo(
                        size: 260,
                      ),
              ),
              const SizedBox(height: 30),
              const Text(
                'The image',
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
