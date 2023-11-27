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
      body: SingleChildScrollView(
        // Menambahkan SingleChildScrollView
        child: _buildCharacterDetails(),
      ),
    );
  }

  Widget _buildCharacterDetails() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailItem("Name", Text(character.name ?? 'N/A')),
          _buildDetailItem("Species", Text(character.species ?? 'N/A')),
          _buildDetailItem("Gender", Text(character.gender ?? 'N/A')),
          _buildDetailItem("House", Text(character.house ?? 'N/A')),
          _buildDetailItem(
              "Date of Birth", Text(character.dateOfBirth ?? 'N/A')),
          _buildDetailItem(
              "Wizard", Text(character.wizard?.toString() ?? 'N/A')),
          _buildDetailItem("Ancestry", Text(character.ancestry ?? 'N/A')),
          _buildDetailItem("Eye Colour", Text(character.eyeColour ?? 'N/A')),
          _buildDetailItem("Hair Colour", Text(character.hairColour ?? 'N/A')),
          _buildDetailItem("Wand", _buildWandDetails(character.wand)),
          _buildDetailItem("Patronus", Text(character.patronus ?? 'N/A')),
          _buildDetailItem("Hogwarts Student",
              Text(character.hogwartsStudent?.toString() ?? 'N/A')),
          _buildDetailItem("Hogwarts Staff",
              Text(character.hogwartsStaff?.toString() ?? 'N/A')),
          _buildDetailItem("Actor", Text(character.actor ?? 'N/A')),
          _buildDetailItem("Alternate Actors",
              Text(character.alternateActors?.join(', ') ?? 'N/A')),
          _buildDetailItem("Alive", Text(character.alive?.toString() ?? 'N/A')),
          _buildDetailItem("Image", _buildCharacterImage(character.image)),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, Widget detailWidget) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
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
          detailWidget,
        ],
      ),
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
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      );
    } else {
      return Text(
        "No image available",
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
      );
    }
  }
}
