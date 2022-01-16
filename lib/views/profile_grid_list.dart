import 'package:flutter/widgets.dart';
import 'package:tailwind/models/profile.dart';
import 'package:tailwind/utilities/unsplash_avatar.dart';
import 'package:tailwind/widgets/card.dart';
import 'package:tailwind/widgets/grid_list.dart';
import 'package:tailwind/widgets/image_tile.dart';

class ProfileGridList extends StatelessWidget {
  static final List<Profile> _profiles = [
    Profile(
      imageUrl: unsplashAvatar('1494790108377-be9c29b29330'),
      name: 'Leslie Alexander',
      position: 'Co-Founder / CEO',
    ),
    Profile(
      imageUrl: unsplashAvatar('1519244703995-f4e0f30006d5'),
      name: 'Michael Foster',
      position: 'Co-Founder / CTO',
    ),
    Profile(
      imageUrl: unsplashAvatar('1506794778202-cad84cf45f1d'),
      name: 'Dries Vincent',
      position: 'Manager, Business Relations',
    ),
    Profile(
      imageUrl: unsplashAvatar('1517841905240-472988babdf9'),
      name: 'Lindsay Walton',
      position: 'Front-end Developer',
    ),
  ];

  final int rows;

  const ProfileGridList({Key? key, required this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridList(
      rows: rows,
      children: _profiles.map(_buildProfileCard).toList(),
    );
  }

  Widget _buildProfileCard(Profile profile) {
    return Card(
      child: ImageTile(
        imageUrl: profile.imageUrl,
        title: profile.name,
        subtitle: profile.position,
      ),
    );
  }
}
