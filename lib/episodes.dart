class GameOfThrones{
  String name, summary;
  Images images;
  Embedded embedded;
  GameOfThrones({this.name, this.images, this.summary, this.embedded});
  GameOfThrones.fromJson(Map<String, dynamic> json){
    name=json['name'];
    images=json['image']!=null ? Images.fromJson(json['image']) : null;
    summary=json['summary'];
    embedded=json['_embedded']!=null ? Embedded.fromJson(json['_embedded']) : null;
  }
}

class Images{
  String medium, original;
  Images({this.medium, this.original});
  Images.fromJson(Map<String, dynamic> json){
    medium=json['medium'];
    original=json['original'];
  }
}

class Embedded{
  List<Episodes> episodes;
  Embedded({this.episodes});
  Embedded.fromJson(Map<String, dynamic> json){
    if(json['episodes']!=null){
      episodes=new List<Episodes>();
      json['episodes'].forEach((value){
        episodes.add(Episodes.fromJson(value));
      });
    }
  }
}

class Episodes{
  String name;
  Images images;
  int season, number;
  Episodes({this.name, this.season, this.number, this.images});

  Episodes.fromJson(Map<String, dynamic> json){
    name=json['name'];
    images=json['image']!=null ? Images.fromJson(json['image']) : null;
    season=json['season'];
    number=json['number'];
  }
}