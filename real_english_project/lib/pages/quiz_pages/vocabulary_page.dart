import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_english_project/model/word_model.dart';
import 'package:real_english_project/pages/quiz_pages/word_page.dart';
import 'package:real_english_project/services/word_repository.dart';

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({Key? key}) : super(key: key);

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  late Future<List<WordModel2>> _futureWords;

  @override
  void initState() {
    super.initState();
    _futureWords = WordRepository().getWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary Notebook'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _futureWords = WordRepository().getWords();
          setState(() {});
        },
        child: FutureBuilder<List<WordModel2>>(
          future: _futureWords,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // Show pie chart and list view of items.
              final items = snapshot.data!;
              return Center(
                child: Container(
                  height: 250,
                  child: ListView.separated(
                      padding: EdgeInsets.all(16.0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildCard(items[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: items.length),
                ),
              );
            } else if (snapshot.hasError) {
              // Show failure error message.
              final failure = "${snapshot.error}"; //as Failure;
              return Center(child: Text(failure));
            }
            // Show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget buildCard(WordModel2 item) {
    return Container(
      width: 200,
      height: 300,
      child: Column(
        children: [
          Expanded(
              child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        20), //kutunun kenarlarını ovalleştirir
                    child: Material(
                      child: Ink.image(
                          image: NetworkImage(item.image),
                          fit: BoxFit.cover,
                          child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WordPage())))),
                    ),
                  ))),
          SizedBox(
            height: 4,
          ),
          Text(item.word, style: TextStyle(fontSize: 24, color: Colors.black))
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pineapple',
    'Grape',
    'Pumpkin',
    'Orange',
    'Strawberry',
    'Blueberry',
    'Watermelon'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';

            ///Bu kısım kuyruğu temizlemek için
            ///query bizim arama çubuğunda yazan şeydir
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);

          ///Arama çubuğunu kapatmak için ///null yerine başka birşey yazabilir miydik
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
