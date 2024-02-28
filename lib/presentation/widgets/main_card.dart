import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://imgs.search.brave.com/FixOGgJ8FT_mRWLlSHfqnny-MX_4Gfz8mx89LJ3StJw/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jNC53/YWxscGFwZXJmbGFy/ZS5jb20vd2FsbHBh/cGVyLzQ1Ny84NzEv/NjYzL21vdmllLXBv/c3Rlci13b25kZXIt/d29tYW4tZ2FsLWdh/ZG90LXBvcnRyYWl0/LWRpc3BsYXktd2Fs/bHBhcGVyLXByZXZp/ZXcuanBn"),
        ),
      ),
    );
  }
}
