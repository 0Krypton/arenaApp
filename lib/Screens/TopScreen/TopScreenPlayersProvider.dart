import 'package:arena/Screens/TopScreen/TopScreenPlayers.dart';
import 'package:flutter/foundation.dart';

enum Regions {
  Na_west,
  Na_east,
  Ir,
}

class TopScreenPlayersProvider extends ChangeNotifier {
  Regions selectedRegion = Regions.Na_west;

  List<PlayerStats> _irPlayers = [
    PlayerStats(
      playerName: 'a_ha_d',
      wins: 4495,
      earning: '-',
      rank: '#1',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'R3sTivE',
      wins: 3197,
      earning: '-',
      urlImage: 'images/r3stive.jpg',
      rank: '#2',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'jenabe7joiner',
      wins: 2363,
      earning: '-',
      urlImage: 'images/jenab7joiner.jpg',
      rank: '#3',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'MojYx',
      wins: 1940,
      earning: '-',
      rank: '#4',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'Rvr Feliko',
      wins: 1869,
      earning: '-',
      urlImage: 'images/feliko.jpg',
      rank: '#5',
      clan: 'Rvr Esports',
    ),
    PlayerStats(
      playerName: 'ZED_0NE',
      wins: 1823,
      earning: '-',
      urlImage: 'images/zed_one.jpg',
      rank: '#6',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'FK_ORCA',
      wins: 1726,
      earning: '-',
      urlImage: 'images/fk_orca.jpg',
      rank: '#7',
      clan: 'NASR Esports',
    ),
    PlayerStats(
      playerName: 'its.vanix',
      wins: 1687,
      earning: '-',
      urlImage: 'images/its_vanix.jpg',
      rank: '#8',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'dt drrahim',
      wins: 1592,
      earning: '-',
      urlImage: 'images/drrahim.jpg',
      rank: '#9',
      clan: 'DT Clan',
    ),
    PlayerStats(
      playerName: 'Desolatorツ',
      wins: 1585,
      earning: '-',
      urlImage: 'images/desolator.jpg',
      rank: '#10',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'WhoisNewbie',
      wins: 1431,
      earning: '-',
      urlImage: 'images/whoisnewbie.jpg',
      rank: '#11',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'KNF xSatixs99',
      wins: 1321,
      earning: '-',
      urlImage: 'images/knf_xsatixs.jpg',
      rank: '#12',
      clan: 'KNF Clan',
    ),
    PlayerStats(
      playerName: 'ArvxTTV',
      wins: 1228,
      earning: '-',
      urlImage: 'images/arvx.jpg',
      rank: '#13',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'saeedboook',
      wins: 1189,
      earning: '-',
      urlImage: 'images/saeedbook.jpg',
      rank: '#14',
      clan: 'Book Clan',
    ),
    PlayerStats(
      playerName: 'MegaKiller ک',
      wins: 1078,
      earning: '-',
      urlImage: 'images/megakillerfn.jpg',
      rank: '#15',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'NuLL SaDiSM',
      wins: 1032,
      earning: '-',
      urlImage: 'images/javjoo.jpg',
      rank: '#16',
      clan: 'NuLL Clan',
    ),
    PlayerStats(
      playerName: 'JK ϟ',
      wins: 952,
      earning: '-',
      urlImage: 'images/jkisscary.jpg',
      rank: '#17',
      clan: 'Viper Clan',
    ),
    PlayerStats(
      playerName: 'VexϟSezaR',
      wins: 903,
      earning: '-',
      urlImage: 'images/sezar_tv.jpg',
      rank: '#18',
      clan: 'Vex Clan',
    ),
    PlayerStats(
      playerName: 'ARTEWIS',
      wins: 902,
      earning: '-',
      urlImage: 'images/artewis.jpg',
      rank: '#19',
      clan: '6ix Clan',
    ),
    PlayerStats(
      playerName: 'WolF_Sami',
      wins: 890,
      earning: '-',
      urlImage: 'images/wolf_sami.jpg',
      rank: '#20',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: 'Twitch-K2Delta38',
      wins: 852,
      earning: '-',
      urlImage: 'images/k2delta.jpg',
      rank: '#21',
      clan: 'no clan',
    ),
    PlayerStats(
      playerName: '23 Av3rY',
      wins: 836,
      earning: '-',
      urlImage: 'images/av3ryfn.jpg',
      rank: '#22',
      clan: 'Reverse & Allies',
    ),
    PlayerStats(
      playerName: 'Rvr Tengo ',
      wins: 709,
      earning: '-',
      urlImage: 'images/realtengo.jpg',
      rank: '#23',
      clan: 'Rvr Esports',
    ),
    PlayerStats(
      playerName: 'YouNi_TV ',
      wins: 679,
      earning: '-',
      urlImage: 'images/youni_tv.jpg',
      rank: '#24',
      clan: 'DT Clan',
    ),
    PlayerStats(
      playerName: '6ix Amrj',
      wins: 675,
      earning: '-',
      urlImage: 'images/amrj.jpg',
      rank: '#25',
      clan: '6ix Clan',
    ),
    PlayerStats(
      playerName: 'NuLL ϟ Codbaba',
      wins: 674,
      earning: '-',
      urlImage: 'images/codbaba.jpg',
      rank: '#26',
      clan: 'NuLL Clan',
    ),
    PlayerStats(
      playerName: 'PowerWOLF.',
      wins: 632,
      earning: '-',
      urlImage: 'images/powerwolf.jpg',
      rank: '#27',
      clan: '-',
    ),
    PlayerStats(
      playerName: 'Ex Loves 02',
      wins: 595,
      earning: '-',
      urlImage: 'images/ex.jpg',
      rank: '#28',
      clan: 'Rvr Esports',
    ),
    PlayerStats(
      playerName: 'ParsiiX ',
      wins: 571,
      earning: '-',
      urlImage: 'images/parsix.jpg',
      rank: '#29',
      clan: 'Viper Clan',
    ),
    PlayerStats(
      playerName: '6ix_tsunami',
      wins: 561,
      earning: '-',
      urlImage: 'images/6ix_tsunami.jpg',
      rank: '#30',
      clan: '6ix Clan',
    ),
    PlayerStats(
      playerName: 'KNF GEИIUS',
      wins: 554,
      earning: '-',
      urlImage: 'images/knf_genius.jpg',
      rank: '#31',
      clan: 'KNF Clan',
    ),
    PlayerStats(
      playerName: 'Persian Shot',
      wins: 529,
      earning: '-',
      urlImage: 'images/persian_shot.jpg',
      rank: '#32',
      clan: 'Punisher Clan',
    ),
    PlayerStats(
      playerName: 'VexϟM.a.y',
      wins: 521,
      earning: '-',
      rank: '#33',
      clan: 'Vex Clan',
    ),
    PlayerStats(
      playerName: 'P69YA_И4',
      wins: 474,
      earning: '-',
      urlImage: 'images/pooya_n4.jpg',
      rank: '#34',
      clan: 'TRT & Rx Clan',
    ),
    PlayerStats(
      playerName: 'Matthew ϟ',
      wins: 428,
      earning: '-',
      urlImage: 'images/matthew.jpg',
      rank: '#35',
      clan: '6ix Clan',
    ),
    PlayerStats(
      playerName: 'KNF Mostafa',
      wins: 401,
      earning: '-',
      urlImage: 'images/knf_mostafa.jpg',
      rank: '#36',
      clan: 'KNF Clan',
    ),
    PlayerStats(
      playerName: 'Ahour4',
      wins: 224,
      earning: '-',
      urlImage: 'images/ahoura.jpg',
      rank: '#37',
      clan: '-',
    ),
  ];
  List<PlayerStats> get irPlayers => _irPlayers;

  List<PlayerStats> _nawestPlayers = [
    PlayerStats(
      playerName: 'Bugha',
      wins: 1869,
      earning: '3,071,383',
      urlImage: 'images/bugha.jpg',
      rank: '#1',
      clan: 'Sentinels Esports',
    ),
    PlayerStats(
      playerName: 'Clix',
      wins: 1823,
      earning: '236,425',
      urlImage: 'images/clix.jpg',
      rank: '#2',
      clan: 'NRG Esports',
    ),
    PlayerStats(
      playerName: 'Faze Megga',
      wins: 1577,
      earning: '348,499',
      urlImage: 'images/megga.jpg',
      rank: '#6',
      clan: 'FaZe Clan',
    ),
    PlayerStats(
      playerName: 'Faze Sway',
      wins: 1577,
      earning: '3,000',
      urlImage: 'images/sway.jpg',
      rank: '#7',
      clan: 'FaZe Clan',
    ),
  ];
  List<PlayerStats> get nawestPlayers => _nawestPlayers;

  List<PlayerStats> _naeastPlayers;
  List<PlayerStats> get naeastPlayers => _naeastPlayers;

  List<PlayerStats> _europePlayers = [
    PlayerStats(
      playerName: 'Mongraal',
      wins: 1687,
      earning: '612,804',
      urlImage: 'images/mongraal.jpg',
      rank: '#1',
      clan: 'FaZe Clan',
    ),
    PlayerStats(
      playerName: 'Benjyfishy',
      wins: 1726,
      earning: '461,194',
      urlImage: 'images/benjyfishy.jpg',
      rank: '#2',
      clan: 'NRG Esports',
    ),
    PlayerStats(
      playerName: 'MrSavage',
      wins: 1687,
      earning: '237,408',
      urlImage: 'images/mrsavage.jpg',
      rank: '#3',
      clan: '100 Thieves',
    ),
    
  ];
  List<PlayerStats> get europePlayers => _europePlayers;

  List<PlayerStats> selectedPlayerRegion;

  void setPlayerRegion(String regions) {
    print('1');
    if (regions.toUpperCase() == 'Iran'.toUpperCase()) {
      selectedPlayerRegion = irPlayers;
    } else if (regions.toUpperCase() == 'Na-west'.toUpperCase()) {
      selectedPlayerRegion = nawestPlayers;
    } else if (regions.toUpperCase() == 'Na-east'.toUpperCase()) {
      selectedPlayerRegion = naeastPlayers;
    } else if (regions.toUpperCase() == 'Europe'.toUpperCase()) {
      selectedPlayerRegion = europePlayers;
    }
    notifyListeners();
  }
}
