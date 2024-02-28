import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const _smartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatefulWidget {
  Section2({super.key});

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  final List imageList = [
    "https://imgs.search.brave.com/B0jASPnvDZr7P1yadsdK_HTrvcMVcdyAy-iyDw5I2Fo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTQ2/MzI5OTkyMS9waG90/by9zcHktaG9sZGlu/Zy1hLWd1bi1pbi1s/aWdodC1wYWludGlu/Zy1hcnRpc3RpYy1w/b3N0ZXItc3R5bGUt/aW1hZ2VyeS53ZWJw/P2I9MSZzPTE3MDY2/N2Emdz0wJms9MjAm/Yz0tcXQ5RmpXWTh1/dzlWT1RZWHQ5aEp6/YXNBWVRFTF9EcUx2/ek5SUmVoVGlBPQ",
    "https://imgs.search.brave.com/FixOGgJ8FT_mRWLlSHfqnny-MX_4Gfz8mx89LJ3StJw/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jNC53/YWxscGFwZXJmbGFy/ZS5jb20vd2FsbHBh/cGVyLzQ1Ny84NzEv/NjYzL21vdmllLXBv/c3Rlci13b25kZXIt/d29tYW4tZ2FsLWdh/ZG90LXBvcnRyYWl0/LWRpc3BsYXktd2Fs/bHBhcGVyLXByZXZp/ZXcuanBn",
    "https://imgs.search.brave.com/FGYZBngwuDSz9jXRW1128THwkorIRotqkxU70mTAmOQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9nZXR3/YWxscGFwZXJzLmNv/bS93YWxscGFwZXIv/ZnVsbC9jLzUvMy8x/MjY3ODY3LW1vdmll/LXBvc3Rlci13YWxs/cGFwZXItMTA4MHgx/OTIwLWZvci1pcGhv/bmUtNi5qcGc"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'We will download a personalised selection of\n movies and shows for you,so there"s\n always something to watch on your \n device',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                  child: CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(0.5),
              )),
              DownloadsImageWidget(
                imageList: imageList[0],
                margin: EdgeInsets.only(left: 170, top: 50),
                angle: 25,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                margin: EdgeInsets.only(right: 170, top: 50),
                angle: -25,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                radius: 8,
                margin: EdgeInsets.only(bottom: 40, top: 50),
                size: Size(size.width * 0.4, size.width * 0.6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See What you can download',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        kwidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            // margin: margin,
            width: size.width,
            height: size.height,
            // color: kBlackColor,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
