class StatPicker {
  final String mode;
  final int trnRatingRank;
  final String trnRatingValue;
  final String scoreValue;
  final String kdValue;
  final String killsValue;
  final String wins;

  StatPicker({
    this.mode,
    this.trnRatingRank, //['p2']['trnRating']['rank']
    this.trnRatingValue, //['p2']['trnRating']['value']
    this.scoreValue, //['p2']['score']['value']
    this.kdValue, //['p2']['kd']['value']
    this.killsValue, //['p2']['kills']['value']
    this.wins, //['p2']['top1']['value']
  });
}

class LifeTimeStatPicker {
  var score; //['lifeTimeStats'][6]['value']
  var wins; //['lifeTimeStats'][8]['value']
  var kills; //['lifeTimeStats][10]['value']
  var kd; //['lifeTimeStats][11]['value']

  LifeTimeStatPicker({
    this.score,
    this.wins,
    this.kills,
    this.kd,
  });
}