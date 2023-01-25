import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ott_platforms/screens/viewPage.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => homePage(),
        'viewPage': (context) => ViewPage()
      },
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentpg = 0;
  CarouselController carouselController = CarouselController();
  List platforms = [
    {
      'name': 'Netflix',
      'url': 'https://www.netflix.com/in/',
      'photo':
          'https://downloadr2.apkmirror.com/wp-content/uploads/2023/01/21/63d018afb6086.png'
    },
    {
      'name': 'Prime',
      'url':
          'https://www.primevideo.com/?ref_=dvm_pds_amz_in_as_s_gm_159_mkw_sRumWk2Nj-dc&mrntrk=pcrid_610141119732_slid__pgrid_84577172328_pgeo_1007760_x__adext__ptid_kwd-303629226711&gclid=Cj0KCQiAw8OeBhCeARIsAGxWtUxGQY30yPZg1dS2sbyCj1UVGYjKXWjzkHjSLupWbBayHPudL_06xqcaAp74EALw_wcB',
      'photo':
          'https://yt3.googleusercontent.com/DglK8d_vYuYhPRN5bhpNA8FkMAbsBrRuvgEa0tAtEA21VZWHyOPBIQDW7yW26lwB6zfauQHw=s900-c-k-c0x00ffffff-no-rj',
    },
    {
      'name': 'Disney +',
      'url': 'https://www.hotstar.com/in',
      'photo': 'https://wallpaperaccess.com/full/2300823.jpg'
    },
    {
      'name': 'Hotstar',
      'url': 'https://www.hotstar.com/in',
      'photo':
          'https://seeklogo.com/images/H/hotstar-logo-6A3E165CC3-seeklogo.com.png'
    },
    {
      'name': 'Sony Liv',
      'url':
          'https://www.sonyliv.com/subscription?utm_source=google&utm_medium=paid&utm_campaign=IN_MSixSonyLIV_NA_Performance_AlwaysON_Brand_Launch_Search_Subscriptions_India_Apr_2022_V0&utm_content=Brand&gclid=Cj0KCQiAw8OeBhCeARIsAGxWtUxxic5EPfseQdnghIJOibAy-bM6euDVYoW2OGLObAWdDgKkWXNat-saAvJQEALw_wcB',
      'photo':
          'https://images.news18.com/ibnlive/uploads/2020/06/1592394351_sonyliv-new-logo.jpg',
    },
  ];
  String name = 'Netflix';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.more_vert,
          size: 27,
        ),
        centerTitle: false,
        title: GestureDetector(
          child: const Text(
            'Enjoy & Chill',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.brown.shade900,
                Colors.red.shade400,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        color: Colors.red.shade400,
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: 700,
          width: double.infinity,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              image: NetworkImage(
                  'https://img.freepik.com/free-vector/flower-seamless-pattern-aesthetic-background-design-vector_53876-144691.jpg?w=2000'),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.red.shade900,
                  blurRadius: 14,
                  spreadRadius: 3,
                  offset: const Offset(-2, -3))
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.grey.shade500,
                    Colors.white12,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(7, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              CarouselSlider(
                carouselController: carouselController,
                items: platforms
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'viewPage',
                                arguments: e);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(e['photo']),
                              ),
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  offset: Offset(7, 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  initialPage: currentpg,
                  onPageChanged: (val, _) {
                    setState(() {
                      currentpg = val;
                      name = platforms[val]['name'];
                    });
                  },
                  height: 500,
                  viewportFraction: 0.75,
                  enlargeCenterPage: true,
                ),
              ),
              Align(
                child: Container(
                  height: 20,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: platforms
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                carouselController.animateToPage(
                                    platforms.indexOf(e),
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                                name = e['name'];
                              });
                            },
                            child: CircleAvatar(
                              radius:
                                  (currentpg == platforms.indexOf(e)) ? 20 : 8,
                              backgroundColor:
                                  (currentpg == platforms.indexOf(e))
                                      ? Colors.red.shade900
                                      : Colors.grey.shade100,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
