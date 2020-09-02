import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:flutter/material.dart';

class ExploreScreenProvider extends ChangeNotifier {
  List<ExploreScreenTournoumentDetail> _searchScreenTournouments = [
    ExploreScreenTournoumentDetail(
      creator: 'User1',
      isPublic: false,
      title: 'Pro FNCS ZoneWars',
      description: 'Fortnite 16v16 Fncs ZoneWars\nwith Prizes',
      game: 'fortnite',
      totalPlayers: 16,
      enteredPlayers: 9,
      prize: 9.99,
      imageUrl: 'images/forntite_regade_raider_cropped.png',
      bgColor: Color(0xFF8A3528),
    ),
    ExploreScreenTournoumentDetail(
      creator: 'User2',
      isPublic: false,
      title: 'Custom Tournament',
      description: 'First Pro Scrim with Great\nPrizes',
      game: 'valorant',
      totalPlayers: 8,
      enteredPlayers: 3,
      prize: 19.99,
      imageUrl: 'images/Reyna_Valorant_cropped.png',
      bgColor: Color(0xFF1F173C),
    ),
    ExploreScreenTournoumentDetail(
      creator: 'User3',
      isPublic: true,
      title: 'ANCS Tournament Open',
      description: 'The beginning of ANCS\nTournament now Available!',
      game: 'fortnite',
      enteredPlayers: 254,
      prize: 50,
      imageUrl: 'images/fortnite-seeker_cropped.png',
      bgColor: Color(0xFF519BB1),
    ),
    ExploreScreenTournoumentDetail(
      creator: 'User4',
      isPublic: false,
      title: 'Public Box PvP',
      description: 'Win the all two Round\nto get your prize',
      game: 'fortnite',
      totalPlayers: 16,
      enteredPlayers: 4,
      prize: 5,
      imageUrl: 'images/rabbit_raider_cropped.png',
      bgColor: Color(0xFFE568A5),
    ),
    ExploreScreenTournoumentDetail(
      creator: 'User5',
      isPublic: false,
      title: 'Pro Creative Tournament',
      description: 'Best & hardship Battle for\nAll of you, so good luck :)',
      game: 'fortnite',
      totalPlayers: 256,
      enteredPlayers: 93,
      prize: 50,
      imageUrl: 'images/fortnite_ghoul_trooper_cropped.png',
      bgColor: Color(0xFF75B0A6),
    ),
    ExploreScreenTournoumentDetail(
      creator: 'User6',
      isPublic: false,
      title: 'Pro Arena Scrims',
      description: 'Play with best & pro players\nin the This Pro Scrim',
      game: 'fortnite',
      totalPlayers: 100,
      enteredPlayers: 43,
      prize: 20,
      imageUrl: 'images/fortnite_torunoment_image_3.png',
      bgColor: Color(0xFF6A02F7),
    ),
    ExploreScreenTournoumentDetail(
      creator: 'User7',
      isPublic: true,
      title: 'Boxfight & Zonewars',
      description: 'Play with best & pro players\nin the This Pro Scrim',
      game: 'fortnite',
      totalPlayers: 16,
      enteredPlayers: 3,
      prize: 1.99,
      imageUrl: 'images/fortnite_starFlare_cropped.png',
      bgColor: Color(0xFF9E0D28),
    ),
    ExploreScreenTournoumentDetail(
      creator: 'User8',
      isPublic: true,
      title: 'Open Tournament',
      description: 'The public tournoument with\nAwesome Prize',
      game: 'valorant',
      totalPlayers: 8,
      enteredPlayers: 5,
      prize: 14.99,
      imageUrl: 'images/Phoenix_valorant_cropped.png',
      bgColor: Color(0xFFFACC56),
    ),
  ];

  List<ExploreScreenTournoumentDetail> get searchScreenTours =>
      _searchScreenTournouments;

  void addSearchScreenRecents(
      ExploreScreenTournoumentDetail exploreScreenTournoumentDetail) {
    recents.add(exploreScreenTournoumentDetail);
    notifyListeners();
  }

  void add(ExploreScreenTournoumentDetail tournoumentDetail) {
    _searchScreenTournouments.add(tournoumentDetail);
    notifyListeners();
  }

  int get searchScreenToursLength => _searchScreenTournouments.length;
}
