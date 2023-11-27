class CharactersHP {
  String? id;
  String? name;
  List<String>? alternateNames;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool? wizard;
  String? ancestry;
  String? eyeColour;
  String? hairColour;
  Wand? wand;
  String? patronus;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  List<dynamic>? alternateActors;
  bool? alive;
  String? image;

  CharactersHP({
    this.id,
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alternateActors,
    this.alive,
    this.image,
  });

  CharactersHP.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    name = json['name'] as String?;
    alternateNames = (json['alternate_names'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
    species = json['species'] as String?;
    gender = json['gender'] as String?;
    house = json['house'] as String?;
    dateOfBirth = json['dateOfBirth'] as String?;
    yearOfBirth = json['yearOfBirth'] as int?;
    wizard = json['wizard'] as bool?;
    ancestry = json['ancestry'] as String?;
    eyeColour = json['eyeColour'] as String?;
    hairColour = json['hairColour'] as String?;
    wand = (json['wand'] as Map<String, dynamic>?) != null
        ? Wand.fromJson(json['wand'] as Map<String, dynamic>)
        : null;
    patronus = json['patronus'] as String?;
    hogwartsStudent = json['hogwartsStudent'] as bool?;
    hogwartsStaff = json['hogwartsStaff'] as bool?;
    actor = json['actor'] as String?;
    alternateActors = json['alternate_actors'] as List?;
    alive = json['alive'] as bool?;
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['alternate_names'] = alternateNames;
    json['species'] = species;
    json['gender'] = gender;
    json['house'] = house;
    json['dateOfBirth'] = dateOfBirth;
    json['yearOfBirth'] = yearOfBirth;
    json['wizard'] = wizard;
    json['ancestry'] = ancestry;
    json['eyeColour'] = eyeColour;
    json['hairColour'] = hairColour;
    json['wand'] = wand?.toJson();
    json['patronus'] = patronus;
    json['hogwartsStudent'] = hogwartsStudent;
    json['hogwartsStaff'] = hogwartsStaff;
    json['actor'] = actor;
    json['alternate_actors'] = alternateActors;
    json['alive'] = alive;
    json['image'] = image;
    return json;
  }
}

class Wand {
  String? wood;
  String? core;
  int? length;

  Wand({
    this.wood,
    this.core,
    this.length,
  });

  Wand.fromJson(Map<String, dynamic> json) {
    wood = json['wood'] as String?;
    core = json['core'] as String?;
    if (json['length'] is int) {
      length = json['length'] as int?;
    } else if (json['length'] is double) {
      length = (json['length'] as double?)?.toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['wood'] = wood;
    json['core'] = core;
    json['length'] = length;
    return json;
  }
}
