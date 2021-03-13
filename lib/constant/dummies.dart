import '../model/flower.dart';
import 'constant.dart';

abstract class Dummies {
  static List<Flower> flowerDumies = [
    Flower(
      category: 'Flower - Purple Flower ',
      condition: 'New',
      description:
          '\'Flora Flower, Nelakurinji, india \' \n\"Red is a rose, blue is a violet, this flower is a proof of our love.\", flora flower is found in any countries of india enriched with very fertile',
      name: "Flora Flower",
      origin: 'Nelakurinji, India',
      weight: '600 - 800 grams',
      image: [
        Constants.assetImage("article-detail.png"),
        Constants.assetImage("article-detail.png"),
        Constants.assetImage("article-detail.png"),
        Constants.assetImage("article-detail.png"),
      ],
      rate: 5,
      price: 30000,
    ),
    Flower(
      category: 'Fiona - Purple Flower ',
      condition: 'New',
      description:
          '\'Fiona Flower, Nelakurinji, Afrika \' \n\"Red is a rose, blue is a violet, this flower is a proof of our love.\", flora flower is found in any countries of india enriched with very fertile',
      name: "Fiona Flower",
      origin: 'Nelakurinji, Afrik',
      weight: '600 - 800 grams',
      image: [
        Constants.assetImage("article-detail.png"),
        Constants.assetImage("article-detail.png"),
        Constants.assetImage("article-detail.png"),
        Constants.assetImage("article-detail.png"),
      ],
      rate: 4,
      price: 30000,
    ),
       Flower(
      category: 'Fioni - Purple Flower ',
      condition: 'New',
      description:
          '\'Fioni Flower, Nelakurinji, Afrika \' \n\"Red is a rose, blue is a violet, this flower is a proof of our love.\", flora flower is found in any countries of india enriched with very fertile',
      name: "Fioni Flower",
      origin: 'Nelakurinji, Afrik',
      weight: '600 - 800 grams',
      image: [
        Constants.assetImage("article-detail.png"),
        Constants.assetImage("article-detail.png"),
        Constants.assetImage("article-detail.png"),
        Constants.assetImage("article-detail.png"),
      ],
      rate: 4,
      price: 10000,
    ),
  ];
}
