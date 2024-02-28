import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  final String videoUrl;
  const VideoListItem({super.key, required this.index, required this.videoUrl});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
   VideoPlayerController? videoPlayerController;
   @override
  void initState() {
    super.initState();
    setState(() {
      videoPlayerController=VideoPlayerController.networkUrl(Uri.parse(videoList[widget.index]));
    });
    videoPlayerController!.initialize();
    videoPlayerController!.play();
    videoPlayerController!.setLooping(true);
  }
  @override
  void dispose() {
    super.dispose();
    videoPlayerController!.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       
        SizedBox.expand(
          child: SizedBox(width: videoPlayerController!.value.size.width,
          height: videoPlayerController!.value.size.height,
          child: VideoPlayer(videoPlayerController!),),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //first section
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_off,
                    color: kwhiteColor,
                    size: 30,
                    ),
                  ),
                ),

                //rightsection
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:NetworkImage(    "https://imgs.search.brave.com/FGYZBngwuDSz9jXRW1128THwkorIRotqkxU70mTAmOQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9nZXR3/YWxscGFwZXJzLmNv/bS93YWxscGFwZXIv/ZnVsbC9jLzUvMy8x/MjY3ODY3LW1vdmll/LXBvc3Rlci13YWxs/cGFwZXItMTA4MHgx/OTIwLWZvci1pcGhv/bmUtNi5qcGc"
                      ) ,
                      ),
                    ),
                    VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActionsWidget(
                        icon: Icons.add, title: 'My List'),
                    VideoActionsWidget(
                        icon: Icons.share, title: 'Share'),
                    VideoActionsWidget(
                        icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,color: kwhiteColor,size: 30,),
          Text(title,style: const TextStyle(color: kwhiteColor,fontSize: 16),),
        ],
      ),
    );
  }
}
