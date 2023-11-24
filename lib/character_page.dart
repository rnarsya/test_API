import 'package:flutter/material.dart';
import 'character_model.dart';
import 'detail_characters.dart';

class PageListCharacters extends StatefulWidget {
  const PageListCharacters({Key? key}) : super(key: key);

  @override
  State<PageListCharacters> createState() => _PageListCharactersState();
}

class _PageListCharactersState extends State<PageListCharacters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Characters Selection",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildListCharactersBody(),
    );
  }

  Widget _buildListCharactersBody() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: loadCharacters(),
        builder: (BuildContext context, AsyncSnapshot<List<CharactersHP>> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            List<CharactersHP> charactersList = snapshot.data!;
            return _buildSuccessSection(charactersList);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text(
        "Terjadi kesalahan",
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildSuccessSection(List<CharactersHP> charactersList) {
    return ListView.builder(
      itemCount: charactersList.length,
      itemBuilder: (BuildContext context, int index) {
        return CharacterItem(character: charactersList[index]);
      },
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class CharacterItem extends StatelessWidget {
  final CharactersHP character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageDetailCharacters(character: character),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.network(
                character.image ?? '',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name ?? '',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    character.species ?? '',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<CharactersHP>> loadCharacters() async {
  // Implement your logic to fetch characters here
  // For example:
  // final response = await yourApiCall();
  // return response.data.characters;
  return [];
}
