import 'package:flutter/material.dart';

const kwidth = SizedBox(
  width: 10,
);
const kHeight = SizedBox(
  height: 10,
);
const kHeight20 = SizedBox(
  height: 20,
);
const kHeight50 = SizedBox(
  height: 50,
);

//BorderRadius

final BorderRadius kRadius10 = BorderRadius.circular(10);
final BorderRadius kRadius30 = BorderRadius.circular(30);

//Image
const kMainImage =
    "https://cdn.shopify.com/s/files/1/0057/3728/3618/files/darkknight.building.24x36_20e90057-f673-4cc3-9ce7-7b0d3eeb7d83_500x749.jpg?v=1707491191";

//textstyle

TextStyle kHomeTitleText =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

//temporary images
const newAndHotTempImage =
    "https://imgs.search.brave.com/_FfFleQ05viZtbV6l4v-bFEbKggwZXNaITja9bRYD50/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9nZXR3/YWxscGFwZXJzLmNv/bS93YWxscGFwZXIv/ZnVsbC82LzkvOC8x/MjY3ODg3LWFtYXpp/bmctbW92aWUtcG9z/dGVyLXdhbGxwYXBl/ci0xOTIweDEyMDAt/cGhvbmUuanBn";
const newAndHotTempImage2 =
    "https://media.themoviedb.org/t/p/w1066_and_h600_bestv2/jYEW5xZkZk2WTrdbMGAPFuBqbDc.jpg";
//video
final List videoList = [
  "https://player.vimeo.com/external/628121359.hd.mp4?s=2a49f587ac63268a52fe86a32c3fad47cfdbc637&profile_id=174&oauth2_token_id=57447761",
  "https://player.vimeo.com/external/428015311.hd.mp4?s=12cd96a23f67d7d4d65cb99a710321b061d500b0&profile_id=174&oauth2_token_id=57447761",
  "https://player.vimeo.com/external/545001212.hd.mp4?s=614f1a62e54ac6b5706189330dba723bb696e217&profile_id=174&oauth2_token_id=57447761",
  "https://player.vimeo.com/external/522224662.sd.mp4?s=5c0f3df1f27d3393a6e76080db91867ba449137d&profile_id=165&oauth2_token_id=57447761",
  "https://player.vimeo.com/external/628121383.hd.mp4?s=dd7e3c9d16ddcab684bf1c15738f5be88f22a46f&profile_id=174&oauth2_token_id=57447761",
  "https://player.vimeo.com/external/399523416.sd.mp4?s=eab128f56442fda715eda4ce91817b0c6c3eef26&profile_id=164&oauth2_token_id=57447761",
  "https://player.vimeo.com/external/494783258.sd.mp4?s=4d01ef1f245f3e7aebbf2e24789c6a654b05c038&profile_id=165&oauth2_token_id=57447761"
];

//api key
class Constants {
  static const apiKey = '3712226feea9cea92324432ab8048bea';
  static const imagePath = 'https://image.tmdb.org/t/p/w500';
}
