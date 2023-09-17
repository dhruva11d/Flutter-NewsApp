// // import 'package:flutter/material.dart';
// //
// // class SplashScreen extends StatelessWidget {
// //   const SplashScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: const [
// //           SizedBox(height: 300,),
// //
// //
// //           FadeInImage(
// //
// //             placeholder : AssetImage("assets/image/a.jpg"),
// //           image: AssetImage("assets/image/a.jpg") ,
// //
// //           height: 230 , width: 230,),
// //
// //           Spacer(),
// //           Text("Dhruva News App" ,textAlign: TextAlign.center ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
// //           SizedBox(height: 20,),
// //         ],
// //       )),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatelessWidget {
//   SplashScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 300,
//             ),
//             // Replace this FadeInImage widget with a network image
//             Image.network(
//               "https://icons8.com/icon/Q3iuMwWv277W/news", // Replace with your image URL
//               height: 230,
//               width: 230,
//               loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                 if (loadingProgress == null) {
//                   return child;
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                           : null,
//                     ),
//                   );
//                 }
//               },
//             ),
//             Spacer(),
//             Text(
//               "Dhruva News App",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
            ),
            // Use CachedNetworkImage to load and cache the image
            CachedNetworkImage(
              imageUrl: "https://icons8.com/icon/Q3iuMwWv277W/news", // Replace with your image URL
              height: 230,
              width: 230,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Spacer(),
            Text(
              "Dhruva News App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
