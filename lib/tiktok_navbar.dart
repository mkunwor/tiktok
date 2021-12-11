import 'package:flutter/material.dart';
import 'package:tiktok/tiktok_home.dart';
class TiktokNavbar extends StatefulWidget {
  const TiktokNavbar({ Key? key }) : super(key: key);

  @override
  _TiktokNavbarState createState() => _TiktokNavbarState();
}

class _TiktokNavbarState extends State<TiktokNavbar> {
  int currentIndex = 0;

  List items = [Icons.home, Icons.search, Icons.add,Icons.notification_add,Icons.person];
 
   final pageController = PageController();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
bottomNavigationBar: BottomNavigationBar(


  onTap: (index){
    currentIndex=index;
    setState(() {});
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.easeIn);
          },


  
  items:List.generate(5, (index) {
              return BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(

                  items[index],
                  color: index == currentIndex ? Colors.blue : Colors.white,
                  size: 30,
                
                ),
                label: 'HOME'
                
              );
            },
          )


),
 body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
             TiktokHome(videos: videos),
          Container(
            child: Center(child: Text("Search page")),
          ),
          Container(
            child: Center(child: Text("Uoload Page")),
          ),
          Container(
            child: Center(child: Text("Inbox Page")),
          ),
          Container(
            child: Center(child: Text("Profile page")),
          )
        ],
      ),

      
    );
  }
}