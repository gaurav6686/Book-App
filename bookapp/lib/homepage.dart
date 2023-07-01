import 'dart:convert';
import 'package:bookapp/readoffline/book1.dart';
import 'package:bookapp/readoffline/book2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'readbook.dart';

//All field which fetch from database using nestjs
class Book {
  final String id;
  final String bookName;
  final String authorName;
  final String imageUrl;
  final String read;

  Book({
    required this.id,
    required this.bookName,
    required this.authorName,
    required this.imageUrl,
    required this.read,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['_id'] ?? '',
      bookName: json['bookName'] ?? '',
      authorName: json['authorName'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      read: json['read'] ?? '',
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final String url = 'http://192.168.233.223:3000/user/list'; //API URL
  //All declare variables
  late Future<List<Book>?> data;
  late String searchQuery;
  double _value = 20;

  //fetch function to fetch data from backend
  Future<List<Book>?> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic>? bookData = jsonData['items'];
        if (bookData != null && bookData.isNotEmpty) {
          final bookList = bookData.map((json) => Book.fromJson(json)).toList();
          return bookList;
        } else {
          return null;
        }
      } else {
        throw Exception(
            'Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error while fetching data: $error');
      throw Exception('Failed to load data. $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    data = fetchData();
    searchQuery = '';
  }

  void filterBooks(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(10.h),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9.w,
                child: Row(
                  children: [
                    //tab1 of EBOOKS
                    Expanded(  
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        tabs: const [
                          Tab(text: 'Ebook'),
                          Tab(text: 'AudioBook'),
                          Tab(text: 'Shop'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 230.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, top: 20.h, bottom: 10.h),
                                child: Text(
                                  'Recommended for you',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 10.w, top: 20.h, bottom: 10.h),
                                child: const Icon(Icons.arrow_forward),
                              )
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 8.w, left: 10.w),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110.h,
                                        width: 100.w,
                                        color: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const book1(),
                                              ),
                                            );
                                          },
                                          child: const Image(
                                            image: NetworkImage(
                                                "https://asitis.com/gif/bgcover.jpg"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: const Text('Bhagavat Gita'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110.h,
                                        width: 100.w,
                                        color: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const book2(),
                                              ),
                                            );
                                          },
                                          child: const Image(
                                            image: NetworkImage(
                                                "https://www.worldhistory.org/img/r/p/1000x1200/5519.jpg.webp?v=1685678343"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: const Text('Mahabharat'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110.h,
                                        width: 100.w,
                                        color: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const book1(),
                                              ),
                                            );
                                          },
                                          child: const Image(
                                            image: NetworkImage(
                                                "https://m.media-amazon.com/images/I/612U1zJ8lcL._AC_UF1000,1000_QL80_.jpg"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: const Text('Shivaji Maharaj'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 110.h,
                                        width: 100.w,
                                        color: Colors.grey,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const book1(),
                                              ),
                                            );
                                          },
                                          child: const Image(
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxD2GnhTpRLs5hWbJ_IJXJ3-oZcccNItliDQ&usqp=CAU"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: const Text('Christmas book'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 90.w, top: 20.h),
                            child: Text(
                              "Search Your Favourite Book",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold,color: Colors.blue[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.w),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  filterBooks(value);
                                },
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder<List<Book>?>(
                                future: data,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final bookList = snapshot.data!;
                                    //serach box filtering function

                                    final filteredList = searchQuery.isEmpty
                                        ? bookList
                                        : bookList.where((book) {
                                            final bookName =
                                                book.bookName.toLowerCase();
                                            final authorName =
                                                book.authorName.toLowerCase();
                                            final lowerCaseQuery =
                                                searchQuery.toLowerCase();

                                            return bookName
                                                    .contains(lowerCaseQuery) ||
                                                authorName
                                                    .contains(lowerCaseQuery);
                                          }).toList();

                                    //return the listview of books
                                    return ListView.builder(
                                      itemCount: filteredList.length,
                                      itemBuilder: (context, index) {
                                        final book = filteredList[index];
                                        return GestureDetector(
                                          child: ListTile(
                                            leading: Container(
                                              height: 80.h,
                                              width: 60.w,
                                              color: Colors.grey,
                                              child: Image.network(
                                                book.imageUrl,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            title: Text(book.bookName),
                                            subtitle: Text(book.authorName),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ReadBook(
                                                  imageUrl: book.imageUrl,
                                                  bookName: book.bookName,
                                                  authorName: book.authorName,
                                                  read: book.read,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text('Error: ${snapshot.error}'),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //tab1 of AUDIOBOOK
              Center(
                  child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          width: 230.w,
                          height: 220.h,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-okwSwlWVDdvPEAgVNaKr9IulROgTsoGKW5D2HRe5RFlPnR4i5sY3bsdllv2AdiYl71A&usqp=CAU",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Text(
                          'The God Book',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Text(
                          "Steav job",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Text("⭐⭐⭐⭐⭐"),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                            width: 280.w,
                            height: 120.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                
                                SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text("11.2"),
                                    SizedBox(
                                      width: 175,
                                    ),
                                    Text("20.0"),
                                  ],
                                ),
                                Container(
                                  child: Slider(
                                    min: 0.0,
                                    max: 100.0,
                                    value: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.skip_previous,
                                          size: 40,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.play_arrow,
                                          size: 40,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.skip_next,
                                          size: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              )),
              const Center(child: Text('Shop Tab')),
            ],
          ),
        );
      },
    );
  }
}
