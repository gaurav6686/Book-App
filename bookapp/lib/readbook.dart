import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//All field which fetch from database using nestjs
class ReadBook extends StatelessWidget {
  final String imageUrl;
  final String bookName;
  final String authorName;
  final String read;

  const ReadBook({
    required this.imageUrl,
    required this.bookName,
    required this.authorName,
    required this.read,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$bookName',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '$authorName',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 70),
                          child: Text(
                            '⭐⭐⭐⭐⭐',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        Container(
                          width: 80.w,
                          height:30.h,
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                          ),
                          child: const Center(child: Text("Download",style: TextStyle(color: Colors.white),),),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 150.h,
                      width: 130.w,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '$read',
                          style:TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
