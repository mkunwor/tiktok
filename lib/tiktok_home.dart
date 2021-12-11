import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'model/video_data.dart';

class TiktokHome extends StatefulWidget {
  const TiktokHome({Key? key,required this.videos}) : super(key: key);
  final VideoData videos;

  @override
  _TiktokHomeState createState() => _TiktokHomeState();
}

class _TiktokHomeState extends State<TiktokHome> {
  List<VideoData> videos = [];
  static final pageController = PageController();

  void fetchPostsDataFromServer() async {
    print("starting data fetch from the server:");
    final url = "https://pixabay.com/api/videos/?key=24747097-7cff9e347dc657ed55d1bc508";
    String dataToBeDisplayed='';

    try {
      final result = await Dio().get(url);

      print("this is our data from server:");
      print(result.statusCode);
      print(result);


      videos = (result.data as List).map<VideoData>((item) {
       VideoData newPost =VideoData.fromJson(item);
        return newPost;
      }).toList();

      setState(() {
        dataToBeDisplayed = result.data.toString();
      });
    } catch (e) {
      print(e);
      setState(() {});
    }

    ///
    // Dio().get(url).then((res) {
    //   print(res);
    // }).catchError((e) {
    //   print(e);
    // });

    ///
  }

  @override
  void initState() {
    super.initState();

    print("\n This is the init state functionn being called \n");

    fetchPostsDataFromServer();
  }


  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;


    return Scaffold(
        body: Stack(children: [
      PageView.builder(
        itemCount:videos.length,
        itemBuilder: (context,index){
          final _currentVideo=videos[index];
           
           return TiktokHome(videos: _currentVideo);




      }),
      Image.asset(
   'assets/images/pc.jpg',
         height: _height,
         fit: BoxFit.cover,
       ),
      Positioned(
        top: 50,
        left: 125,
        child: Container(
          //color: Colors.purple,
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Following",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "|",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "For You",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@Tiktoker123',
                style: TextStyle(
                    fontSize: 15,

                    // fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '#Caption',
                style: TextStyle(
                    fontSize: 15,

                    // fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '#viral #fyp',
                style: TextStyle(
                    fontSize: 15,

                    // fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Icon(
                Icons.music_note,
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      Positioned(
         
        bottom: 50,
        right: 0,
        child: Container(
          child: Column(
            children: [
              Image.asset('assets/images/dp.png', height: 50, width: 50),
              SizedBox(height: 20),
              Icon(Icons.favorite, size: 40, color: Colors.red),
              Text("8.0M",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Icon(Icons.comment, size: 40, color: Colors.white),
              Text("2.9M",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Icon(Icons.screen_share_outlined, size: 40, color: Colors.white),
              Text("1.3M",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Image.asset('assets/images/dp.png', height: 50, width: 50),
            ],
          ),
        ),
      )
    ]));
  }
}
