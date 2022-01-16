import 'package:flutter/widgets.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:tailwind/models/profile.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';
import 'package:tailwind/utilities/unsplash_avatar.dart';
import 'package:tailwind/widgets/divider.dart';
import 'package:tailwind/widgets/stacked_list_item.dart';

class ProfileStackedList extends StatelessWidget {
  static final List<Profile> _profiles = [
    Profile(
      imageUrl: unsplashAvatar('1494790108377-be9c29b29330'),
      name: 'Leslie Abbott',
      position: 'Co-Founder / CEO',
    ),
    Profile(
      imageUrl: unsplashAvatar('1500648767791-00dcc994a43e'),
      name: 'Hector Adams',
      position: 'VP, Marketing',
    ),
    Profile(
      imageUrl: unsplashAvatar('1520785643438-5bf77931f493'),
      name: 'Blake Alexander',
      position: 'Account Coordinator',
    ),
    Profile(
      imageUrl: unsplashAvatar('1507003211169-0a1dd7228f2d'),
      name: 'Fabricio Andrews',
      position: 'Senior Art Director',
    ),
    Profile(
      imageUrl: unsplashAvatar('1501031170107-cfd33f0cbdcc'),
      name: 'Angela Beaver',
      position: 'Chief Strategy Officer',
    ),
    Profile(
      imageUrl: unsplashAvatar('1506980595904-70325b7fdd90'),
      name: 'Yvette Blanchard',
      position: 'Studio Artist',
    ),
    Profile(
      imageUrl: unsplashAvatar('1513910367299-bce8d8a0ebf6'),
      name: 'Lawrence Brooks',
      position: 'Content Specialist',
    ),
    Profile(
      imageUrl: unsplashAvatar('1517070208541-6ddc4d3efbcb'),
      name: 'Jeffrey Clark',
      position: 'Senior Art Director',
    ),
    Profile(
      imageUrl: unsplashAvatar('1487412720507-e7ab37603c6f'),
      name: 'Kathryn Cooper',
      position: 'Associate Creative Director',
    ),
    Profile(
      imageUrl: unsplashAvatar('1509783236416-c9ad59bae472'),
      name: 'Alicia Edwards',
      position: 'Junior Copywriter',
    ),
    Profile(
      imageUrl: unsplashAvatar('1531427186611-ecfd6d936c79'),
      name: 'Benjamin Emerson',
      position: 'Director, Print Operations',
    ),
    Profile(
      imageUrl: unsplashAvatar('1504703395950-b89145a5425b'),
      name: 'Jillian Erics',
      position: 'Designer',
    ),
    Profile(
      imageUrl: unsplashAvatar('1550525811-e5869dd03032'),
      name: 'Chelsea Evans',
      position: 'Human Resources Manager',
    ),
    Profile(
      imageUrl: unsplashAvatar('1519244703995-f4e0f30006d5'),
      name: 'Michael Gillard',
      position: 'Co-Founder / CTO',
    ),
    Profile(
      imageUrl: unsplashAvatar('1506794778202-cad84cf45f1d'),
      name: 'Dries Giuessepe',
      position: 'Manager, Business Relations',
    ),
    Profile(
      imageUrl: unsplashAvatar('1507101105822-7472b28e22ac'),
      name: 'Jenny Harrison',
      position: 'Studio Artist',
    ),
    Profile(
      imageUrl: unsplashAvatar('1517841905240-472988babdf9'),
      name: 'Lindsay Hatley',
      position: 'Front-end Developer',
    ),
    Profile(
      imageUrl: unsplashAvatar('1534528741775-53994a69daeb'),
      name: 'Anna Hill',
      position: 'Partner, Creative',
    ),
    Profile(
      imageUrl: unsplashAvatar('1438761681033-6461ffad8d80'),
      name: 'Courtney Samuels',
      position: 'Designer',
    ),
    Profile(
      imageUrl: unsplashAvatar('1472099645785-5658abf4ff4e'),
      name: 'Tom Simpson',
      position: 'Director, Product Development',
    ),
    Profile(
      imageUrl: unsplashAvatar('1463453091185-61582044d556'),
      name: 'Floyd Thompson',
      position: 'Principal Designer',
    ),
    Profile(
      imageUrl: unsplashAvatar('1519345182560-3f2917c472ef'),
      name: 'Leonard Timmons',
      position: 'Senior Designer',
    ),
    Profile(
      imageUrl: unsplashAvatar('1517365830460-955ce3ccd263'),
      name: 'Whitney Trudeau',
      position: 'Copywriter',
    ),
    Profile(
      imageUrl: unsplashAvatar('1500917293891-ef795e70e1f6'),
      name: 'Kristin Watson',
      position: 'VP, Human Resources',
    ),
    Profile(
      imageUrl: unsplashAvatar('1502685104226-ee32379fefbe'),
      name: 'Emily Wilson',
      position: 'VP, User Experience',
    ),
    Profile(
      imageUrl: unsplashAvatar('1505840717430-882ce147ef2d'),
      name: 'Emma Young',
      position: 'Senior Front-end Developer',
    ),
  ];

  const ProfileStackedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, List<Profile>> alphabetized = _alphabetizeProfiles(_profiles);
    List<String> letters = alphabetized.keys.toList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        String letter = letters[index];
        List<Profile> profiles = alphabetized[letter] ?? [];
        return _buildLetterList(context, letter, profiles);
      },
      itemCount: letters.length,
    );
  }

  Map<String, List<Profile>> _alphabetizeProfiles(List<Profile> profiles) {
    Map<String, List<Profile>> alphabetized = {};
    for (Profile profile in _profiles) {
      String letter = profile.name.split(' ').last.substring(0, 1);
      if (!alphabetized.containsKey(letter)) {
        alphabetized[letter] = [];
      }
      alphabetized[letter]?.add(profile);
    }
    return alphabetized;
  }

  Widget _buildLetterList(
      BuildContext context, String letter, List<Profile> profiles) {
    return StickyHeader(
      header: _buildHeader(context, letter),
      content: _buildProfiles(context, profiles),
    );
  }

  Widget _buildHeader(BuildContext context, String letter) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.gray200,
          ),
        ),
        color: Colors.gray50,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 6 * 4,
        vertical: 1 * 4,
      ),
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: FontSizes.sm,
          height: FontHeights.sm,
          fontWeight: FontWeights.medium,
          color: Colors.gray500,
        ),
      ),
    );
  }

  Widget _buildProfiles(BuildContext context, List<Profile> profiles) {
    return Column(
      children: profiles.map((Profile profile) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (profile != profiles.first) ...[
              const Divider(),
            ],
            StackedListItem(
              imageUrl: profile.imageUrl,
              title: profile.name,
              subtitle: profile.position,
            ),
          ],
        );
      }).toList(),
    );
  }
}
