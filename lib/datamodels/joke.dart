class Joke {
  int id;
  String type;
  String setup;
  String punchline;

  Joke({this.id, this.type, this.setup, this.punchline});

  factory Joke.fromJson(Map<String, dynamic> json){
    return Joke(
      id: json['id'],
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline']
    );
  }
}
