import 'dart:convert';

import 'package:arena/Utilities/ExploreScreenItemDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExploreScreenProvider extends ChangeNotifier {
  List<ExploreScreenTournoumentDetail> _enteredTours = [];

  List<ExploreScreenTournoumentDetail> get enteredTours => _enteredTours;

  List<ExploreScreenTournoumentDetail> _searchScreenTournouments = [
    // ExploreScreenTournoumentDetail(
    //   creator: 'User1',
    //   isPublic: false,
    //   title: 'Pro FNCS ZoneWars',
    //   description: 'Fortnite 16v16 Fncs ZoneWars\nwith Prizes',
    //   game: 'fortnite',
    //   totalPlayers: 16,
    //   enteredPlayers: 9,
    //   prize: 9.99,
    //   imageUrl: 'images/forntite_regade_raider_cropped.png',
    //   bgColor: Color(0xFF8A3528),
    // ),
    // ExploreScreenTournoumentDetail(
    //   creator: 'User2',
    //   isPublic: false,
    //   title: 'Custom Tournament',
    //   description: 'First Pro Scrim with Great\nPrizes',
    //   game: 'valorant',
    //   totalPlayers: 8,
    //   enteredPlayers: 3,
    //   prize: 19.99,
    //   imageUrl: 'images/Reyna_Valorant_cropped.png',
    //   bgColor: Color(0xFF1F173C),
    // ),
    // ExploreScreenTournoumentDetail(
    //   creator: 'User3',
    //   isPublic: true,
    //   title: 'ANCS Tournament Open',
    //   description: 'The beginning of ANCS\nTournament now Available!',
    //   game: 'fortnite',
    //   enteredPlayers: 254,
    //   prize: 50,
    //   imageUrl: 'images/fortnite-seeker_cropped.png',
    //   bgColor: Color(0xFF519BB1),
    // ),
    // ExploreScreenTournoumentDetail(
    //   creator: 'User4',
    //   isPublic: false,
    //   title: 'Public Box PvP',
    //   description: 'Win the all two Round\nto get your prize',
    //   game: 'fortnite',
    //   totalPlayers: 16,
    //   enteredPlayers: 4,
    //   prize: 5,
    //   imageUrl: 'images/rabbit_raider_cropped.png',
    //   bgColor: Color(0xFFE568A5),
    // ),
    // ExploreScreenTournoumentDetail(
    //   creator: 'User5',
    //   isPublic: false,
    //   title: 'Pro Creative Tournament',
    //   description: 'Best & hardship Battle for\nAll of you, so good luck :)',
    //   game: 'fortnite',
    //   totalPlayers: 256,
    //   enteredPlayers: 93,
    //   prize: 50,
    //   imageUrl: 'images/fortnite_ghoul_trooper_cropped.png',
    //   bgColor: Color(0xFF75B0A6),
    // ),
    // ExploreScreenTournoumentDetail(
    //   creator: 'User6',
    //   isPublic: false,
    //   title: 'Pro Arena Scrims',
    //   description: 'Play with best & pro players\nin the This Pro Scrim',
    //   game: 'fortnite',
    //   totalPlayers: 100,
    //   enteredPlayers: 43,
    //   prize: 20,
    //   imageUrl: 'images/fortnite_torunoment_image_3.png',
    //   bgColor: Color(0xFF6A02F7),
    // ),
    // ExploreScreenTournoumentDetail(
    //   creator: 'User7',
    //   isPublic: true,
    //   title: 'Boxfight & Zonewars',
    //   description: 'Play with best & pro players\nin the This Pro Scrim',
    //   game: 'fortnite',
    //   totalPlayers: 16,
    //   enteredPlayers: 3,
    //   prize: 1.99,
    //   imageUrl: 'images/fortnite_starFlare_cropped.png',
    //   bgColor: Color(0xFF9E0D28),
    // ),
    // ExploreScreenTournoumentDetail(
    //   creator: 'User8',
    //   isPublic: true,
    //   title: 'Open Tournament',
    //   description: 'The public tournoument with\nAwesome Prize',
    //   game: 'valorant',
    //   totalPlayers: 8,
    //   enteredPlayers: 5,
    //   prize: 14.99,
    //   imageUrl: 'images/Phoenix_valorant_cropped.png',
    //   bgColor: Color(0xFFFACC56),
    // ),
  ];

  final String authToken;
  final String userEmail;
  final String userId;
  ExploreScreenProvider(this.authToken, this.userEmail, this.userId,
      this._searchScreenTournouments);

  bool _isEntered = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void toggleIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  bool get isEntered => _isEntered;

  void toggleEnter() {
    _isEntered = !_isEntered;
    notifyListeners();
  }

  List<ExploreScreenTournoumentDetail> get searchScreenTours =>
      _searchScreenTournouments;

  void addSearchScreenRecents(
      ExploreScreenTournoumentDetail exploreScreenTournoumentDetail) {
    recents.add(exploreScreenTournoumentDetail);
    notifyListeners();
  }

  Future fetchAndSetProduct() async {
    var url =
        'https://arena-9e2f5.firebaseio.com/requestedTours.json?auth=$authToken';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      List<ExploreScreenTournoumentDetail> loadedTours = [];
      extractedData.forEach((tourId, tourData) {
        loadedTours.add(
          ExploreScreenTournoumentDetail(
            bgColor: Color.fromARGB(
              tourData['colorA'],
              tourData['colorR'],
              tourData['colorG'],
              tourData['colorB'],
            ),
            creator: tourData['creator'],
            description: tourData['description'],
            enteredPlayers: int.parse(tourData['entered_players'].toString()),
            id: tourId,
            game: tourData['game'],
            imageUrl: tourData['image_url'],
            isPublic: tourData['isPublic'],
            prize: double.parse(tourData['prize'].toString()),
            title: tourData['title'],
            totalPlayers: tourData['total_players'],
          ),
        );
      });

      print('### Tournouments Fetched ###');
      _searchScreenTournouments = loadedTours;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future fetchEnteredTournouments() async {
    var url =
        'https://arena-9e2f5.firebaseio.com/Tournouments.json?auth=$authToken';

    var itemUrl =
        'https://arena-9e2f5.firebaseio.com/requestedTours.json?auth=$authToken';

    try {
      final toursResponse = await http.get(itemUrl);
      final extractedTours =
          json.decode(toursResponse.body) as Map<String, dynamic>;

      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      List<ExploreScreenTournoumentDetail> loadedTours = [];
      extractedTours.forEach((tournoumentId, tourData) {
        extractedData.forEach((key, value) {
          // print('key : $key ');
          var values = (value.values).toList();

          for (int i = 0; i < values.length; i++) {
            if (values[i]['userId'] == userId && key == tournoumentId) {
              // print(values[i]['userId']);
              loadedTours.add(
                ExploreScreenTournoumentDetail(
                  bgColor: Color.fromARGB(
                    tourData['colorA'],
                    tourData['colorR'],
                    tourData['colorG'],
                    tourData['colorB'],
                  ),
                  creator: tourData['creator'],
                  description: tourData['description'],
                  enteredPlayers:
                      int.parse(tourData['entered_players'].toString()),
                  id: tournoumentId,
                  game: tourData['game'],
                  imageUrl: tourData['image_url'],
                  isPublic: tourData['isPublic'],
                  prize: double.parse(tourData['prize'].toString()),
                  title: tourData['title'],
                  totalPlayers: tourData['total_players'],
                ),
              );
              notifyListeners();
              // print(key);
              // print(tournoumentId);
              // final tour = extractedTours[tournoumentId == key];
              // print(tourData['id']);
            }
          }
          // print("length ${keys.length}");
          // print(keys[0]['userId']);
        });
      });
      _enteredTours = loadedTours;
      notifyListeners();
    }
    // try {
    //   final response = await http.get(url);
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //   List<ExploreScreenTournoumentDetail> loadedTours = [];
    //   print(extractedData);

    //   extractedData.forEach((key, value) {
    //     print('key : $key ');
    //     var values = (value.values).toList();

    //     for (int i = 0; i < values.length; i++) {
    //       if (values[i]['userId'] == userId) {
    //         print(values[i]['userId']);
    //         print(key);
    //         int tour = _searchScreenTournouments
    //             .indexWhere((element) => element.id == key);

    //         print(_searchScreenTournouments[tour].id);
    //       }
    //     }
    //     print("length ${keys.length}");
    //     print(keys[0]['userId']);
    //   });

    //_enteredTours = loadedTours;
    // notifyListeners();
    // }
    catch (e) {
      throw e;
    }
  }

  Future<void> enterToTournoument(String id, bool boolIsEntered) async {
    final tourIndex =
        _searchScreenTournouments.indexWhere((element) => element.id == id);

    if (tourIndex >= 0) {
      final url =
          'https://arena-9e2f5.firebaseio.com/Tournouments/$id/$userId.json?auth=$authToken';
      //  'https://arena-9e2f5.firebaseio.com/Tournouments/${_searchScreenTournouments[tourIndex].creator}${_searchScreenTournouments[tourIndex].game}${_searchScreenTournouments[tourIndex].title}/$userId.json?auth=$authToken';

      if (_searchScreenTournouments[tourIndex].enteredPlayers <
          _searchScreenTournouments[tourIndex].totalPlayers) {
        toggleEnter();
        await http
            .put(
          url,
          body: json.encode(
            {
              'email': '$userEmail',
              'userId': '$userId',
            },
          ),
        )
            .then(
          (response) {
            print(response.statusCode);
            if (response.statusCode >= 400) {
              throw 'Oops Something went wrong!';
            } else if (response.statusCode == 200) {
              throw 'Succesful';
            }
          },
        );
      }
      // if (_searchScreenTournouments[tourIndex].enteredPlayers <
      //     _searchScreenTournouments[tourIndex].totalPlayers) {
      //   toggleEnter();

      //   int enteredNumber = _searchScreenTournouments[tourIndex].enteredPlayers;
      //   if (boolIsEntered) {
      //     enteredNumber += 1;
      //     if (enteredNumber < 0) enteredNumber = 0;
      //     _searchScreenTournouments[tourIndex].enteredPlayers = enteredNumber;
      //     await http
      //         .put(
      //       url,
      //       body: json.encode(
      //         {
      //           'entered_players': ['$authToken'],
      //         },
      //       ),
      //     )
      //         .then(
      //       (response) {
      //         if (response.statusCode >= 400) {
      //           throw 'Oops Something went wrong!';
      //         }
      //         notifyListeners();
      //       },
      //     );
      //   } else {
      //     enteredNumber -= 1;
      //     if (enteredNumber < 0) enteredNumber = 0;
      //     _searchScreenTournouments[tourIndex].enteredPlayers = enteredNumber;
      //     await http
      //         .patch(
      //       url,
      //       body: json.encode({
      //         'entered_players': enteredNumber,
      //       }),
      //     )
      //         .then(
      //       (response) {
      //         if (response.statusCode >= 400) {
      //           throw 'Oops Something went wrong!';
      //         }
      //         notifyListeners();
      //       },
      //     );
      //   }

      //   notifyListeners();
      // }
    }
  }

  Future<void> add(ExploreScreenTournoumentDetail tournoumentDetail) async {
    final url =
        'https://arena-9e2f5.firebaseio.com/requestedTours.json?auth=$authToken';

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': tournoumentDetail.title,
          'description': tournoumentDetail.description,
          'prize': tournoumentDetail.prize,
          'isPublic': tournoumentDetail.isPublic,
          'game': tournoumentDetail.game,
          'creator': tournoumentDetail.creator,
          'total_players': tournoumentDetail.totalPlayers,
          'entered_players': tournoumentDetail.enteredPlayers,
          'colorA': 255,
          'colorR': 255,
          'colorG': 255,
          'colorB': 255,
          'image_url':
              'https://firebasestorage.googleapis.com/v0/b/arena-9e2f5.appspot.com/o/daco.png?alt=media&token=2bb43caf-5d54-4d8d-8738-9b93ec32df1c',
        }),
      );
      //Color.fromARGB(255, 255, 255, 255)
      final tour = ExploreScreenTournoumentDetail(
        id: json.decode(response.body)['name'],
        title: tournoumentDetail.title,
        description: tournoumentDetail.description,
        prize: tournoumentDetail.prize,
        isPublic: tournoumentDetail.isPublic,
        game: tournoumentDetail.game,
        totalPlayers: tournoumentDetail.totalPlayers,
        enteredPlayers: 0,
        creator: tournoumentDetail.creator,
        imageUrl: tournoumentDetail.imageUrl,
        bgColor: tournoumentDetail.bgColor,
      );
      _searchScreenTournouments.add(tour);
      print("Tournoument Created with id ${tour.id}");
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  int get searchScreenToursLength => _searchScreenTournouments.length;
}
