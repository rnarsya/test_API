import 'package:flutter/material.dart';

import 'character_model.dart';

class PageDetailCharacters extends StatelessWidget {
  final CharactersHP character;

  PageDetailCharacters({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name ?? 'Character Detail',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildCharacterDetails(),
    );
  }

  Widget _buildCharacterDetails() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailItem("Name", character.name),
          _buildDetailItem("Species", character.species),
          _buildDetailItem("Gender", character.gender),
          _buildDetailItem("House", character.house),
          _buildDetailItem("Date of Birth", character.dateOfBirth),
          _buildDetailItem("Wizard", character.wizard?.toString() ?? ''),
          _buildDetailItem("Ancestry", character.ancestry),
          _buildDetailItem("Eye Colour", character.eyeColour),
          _buildDetailItem("Hair Colour", character.hairColour),
          _buildDetailItem("Wand", _buildWandDetails(character.wand) as String?),
          _buildDetailItem("Patronus", character.patronus),
          _buildDetailItem("Hogwarts Student", character.hogwartsStudent?.toString() ?? ''),
          _buildDetailItem("Hogwarts Staff", character.hogwartsStaff?.toString() ?? ''),
          _buildDetailItem("Actor", character.actor),
          _buildDetailItem("Alternate Actors", character.alternateActors?.join(', ')),
          _buildDetailItem("Alive", character.alive?.toString() ?? ''),
          _buildDetailItem("Image", _buildCharacterImage(character.image) as String?),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label:",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          value ?? 'N/A',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildWandDetails(Wand? wand) {
    if (wand != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Wood: ${wand.wood}",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          Text(
            "Core: ${wand.core}",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          Text(
            "Length: ${wand.length?.toString() ?? 'N/A'} inches",
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ],
      );
    } else {
      return Text(
        "N/A",
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      );
    }
  }

  Widget _buildCharacterImage(String? imageUrl) {
    return Container(
      width: 200,
      height: 200,
      child: Image.network(
        imageUrl ?? '',
        fit: BoxFit.cover,
      ),
    );
  }
}
