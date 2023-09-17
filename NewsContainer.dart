// import 'package:flutter/material.dart';
//
// import 'package:url_launcher/url_launcher.dart';
// import 'package:newsapp1/view/detail_view.dart';
//
// class NewsContainer extends StatelessWidget {
//   String imgUrl;
//   String newsHead;
//   String newsDes;
//   String newsUrl;
//   String newsCnt;
//   NewsContainer(
//       {super.key,
//       required this.imgUrl,
//       required this.newsDes,
//       required this.newsCnt,
//       required this.newsHead,
//       required this.newsUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         FadeInImage.assetNetwork(
//             height: 400,
//             width: MediaQuery.of(context).size.width,
//             fit: BoxFit.cover,
//             placeholder: "assets/img/placeholder.jfif",
//             image: imgUrl),
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             SizedBox(
//               height: 30,
//             ),
//             Text(
//               newsHead.length > 90
//                   ? "${newsHead.substring(0, 90)}..."
//                   : newsHead,
//               style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Text(
//               newsDes,
//               style: TextStyle(fontSize: 12, color: Colors.black38),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Text(
//               newsCnt != "--"
//                   ? newsCnt.length > 250
//                       ? newsCnt.substring(0, 250)
//                       : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
//                   : newsCnt,
//               style: TextStyle(fontSize: 16),
//             ),
//           ]),
//         ),
//         Spacer(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 DetailViewScreen(newsUrl: newsUrl)));
//                   },
//                   child: Text("Read More")),
//             ),
//           ],
//         ),
//         Center(
//             child: TextButton(
//                 onPressed: () async {
//                   await launchUrl(Uri.parse("https://newsapi.org/"));
//                 },
//                 child: Text(
//                   "News Provided By NewsAPI.org",
//                   style: TextStyle(fontSize: 12),
//                   textAlign: TextAlign.center,
//                 ))),
//         SizedBox(
//           height: 20,
//         ),
//       ]),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:newsapp1/view/detail_view.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsContainer> newsContainers;

  NewsGrid({required this.newsContainers});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
      ),
      itemCount: newsContainers.length,
      itemBuilder: (context, index) {
        return newsContainers[index];
      },
    );
  }
}

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;
  NewsContainer({
    Key? key,
    required this.imgUrl,
    required this.newsDes,
    required this.newsCnt,
    required this.newsHead,
    required this.newsUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Adjust the container's height and width according to your needs
      height: 400,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display a CircularProgressIndicator while the image is loading
          FutureBuilder<void>(
            future: loadImage(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error loading image'));
              } else {
                return FadeInImage.assetNetwork(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: '',
                  image: imgUrl,
                );
              }
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  newsHead.length > 90
                      ? "${newsHead.substring(0, 90)}..."
                      : newsHead,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  newsDes,
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailViewScreen(newsUrl: newsUrl),
                      ),
                    );
                  },
                  child: Text("Read More"),
                ),
              ),
            ],
          ),
          Center(
            child: TextButton(
              onPressed: () async {
                await launchUrl(Uri.parse("https://newsapi.org/"));
              },
              child: Text(
                "News Provided By NewsAPI.org",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Future<void> loadImage() async {
    // Simulate loading an image (replace this with actual image loading logic)
    await Future.delayed(Duration(seconds: 2));
  }
}
