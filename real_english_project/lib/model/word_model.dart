class WordModel2 {
  final String word;
  final String words_mean;
  final String image;

  const WordModel2(
      {required this.word, required this.words_mean, required this.image});

  factory WordModel2.fromMap(Map<String, dynamic> map){
    final properties = map['properties'] as Map<String, dynamic>;
    final wordList = (properties['Word'] ?['title'] ?? []) as List;
    final image = properties['Image']?['url'] as String;

    return WordModel2(
        word: wordList.isNotEmpty ? wordList[0]['plain_text'] : '?',
        words_mean: properties['Mean'] ? ['rich_text'] ? [0] ? ['plain_text'] ??
            'Any',
        image: image);
  }
}