import 'package:bookapp/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class frontHome extends StatelessWidget {
  const frontHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
      return Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image.asset("assets/FlutterBlogMainImage.jpg"),
              SizedBox(height: 20.h,),
              Text("Welcome",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 10.h,),
              Text("Books are important for the mind, heart,\n and soul.Take the free benefit & enjoy.\nA word after word after a word is power.",style: TextStyle(fontSize: 18,),),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top:50),
                  height: 50.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Center(child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 20))),
                ),
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
