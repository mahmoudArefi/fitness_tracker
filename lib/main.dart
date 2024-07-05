import 'package:fitness_tracker_app/screens/home_screen/home_screen_view.dart';
import 'package:fitness_tracker_app/screens/insert_basic_info_screen/insert_basic_info_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/localization/translation_file.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home: HomeScreenView(),
    );
  }
}



//
// import 'package:flutter/material.dart';
// import 'package:fitness_tracker_app/common/assets_path/asset_image_path.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ImageAnimationScreen(),
//     );
//   }
// }
//
// class ImageAnimationScreen extends StatefulWidget {
//   @override
//   _ImageAnimationScreenState createState() => _ImageAnimationScreenState();
// }
//
// class _ImageAnimationScreenState extends State<ImageAnimationScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   final double imageWidth = 2568.0;
//   final double screenWidth = 1900.0;
//   final double startPoint = (2568 - 1900) / 5;
//
//   double test = 0  ;
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//
//     _animation = Tween<double>(
//       begin: startPoint,
//       end: startPoint + 100,
//     ).animate(_controller)
//       ..addListener(() {
//         setState(() {});
//       });
//
//     // Start the animation
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _advanceImage() {
//    for(int i = 0  ; i <50 ; i++){
//     setState(() {
//       test += 11 ;
//     });
//    }
//     return ;
//     if (_controller.status == AnimationStatus.completed) {
//       // If animation is completed, do nothing
//       return;
//     } else if (_controller.status == AnimationStatus.forward ||
//         _controller.status == AnimationStatus.reverse) {
//       // If animation is running, stop it and remember current value
//       double currentValue = _controller.value;
//       _controller.stop();
//
//       // Calculate remaining duration based on how much is left to animate
//       double remainingDuration = (_controller.duration! * (1 - currentValue)).inMilliseconds.toDouble() / 1000;
//
//       // Resume animation from where it was stopped
//       _controller = AnimationController(
//         duration: Duration(seconds: remainingDuration.toInt()),
//         vsync: this,
//       );
//
//       _animation = Tween<double>(
//         begin: _controller.value,
//         end: startPoint + 100,
//       ).animate(_controller)
//         ..addListener(() {
//           setState(() {});
//         });
//
//       _controller.forward();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: _advanceImage,
//         child: Icon(Icons.arrow_forward),
//       ),
//       body: Stack(
//         children: [
//           Positioned(
//             left: -_animation.value,
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width * 2.1,
//               child: Image.asset(
//                 MyImage.insertDataScreenBackGround, // Replace with your image path
//                 width: imageWidth,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
