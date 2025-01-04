import 'package:flutter/widgets.dart';

import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsfeedCard(
          userName: 'Jon Casimero',
          postContent: 'MY LUV <333',
          initialLikes: 273, 
          profileImage: 'assets/images/jon.jpg',
          postImage: 'assets/images/Cute Siamese.jpg',
        ),
        NewsfeedCard(
          userName: 'Mikey Madison',
          postContent: 'Watch ANORA !! <333',
          initialLikes: 965, 
          profileImage: 'assets/images/mikey madison.jpg',
        ),
      ],
    );
  }
}
