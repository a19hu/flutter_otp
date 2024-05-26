import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterotp/pages/login_page.dart';
import 'firebase_options.dart';
import 'package:camera/camera.dart';

// import 'package:firebase_auth/firebase_auth.dart';
void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  
  final cameras = await availableCameras();
  final firstCamera = cameras.firstWhere((camera) {
    return camera.lensDirection == CameraLensDirection.front;
  });

  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:LoginPage(camera: firstCamera) ,
    ));
}


