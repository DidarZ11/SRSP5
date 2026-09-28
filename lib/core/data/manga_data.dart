// Демонстрационные данные магазина манги (без базы данных).

class Manga {
  final String id;
  final String title;
  final String volume;
  final String genre;
  final int price;
  final String image;

  const Manga({
    required this.id,
    required this.title,
    required this.volume,
    required this.genre,
    required this.price,
    required this.image,
  });
}

// Список манги в каталоге.
const List<Manga> mangaList = [
  Manga(
    id: '1',
    title: 'Naruto',
    volume: '46',
    genre: 'Сёнэн',
    price: 4500,
    image: 'assets/images/naruto.jpg',
  ),
  Manga(
    id: '2',
    title: 'Chainsaw Man',
    volume: '1',
    genre: 'Экшен',
    price: 5200,
    image: 'assets/images/chainsaw_man.jpg',
  ),
  Manga(
    id: '3',
    title: 'Jujutsu Kaisen',
    volume: '26',
    genre: 'Сёнэн',
    price: 4900,
    image: 'assets/images/jujutsu_kaisen.jpg',
  ),
  Manga(
    id: '4',
    title: 'Blue Lock',
    volume: '5',
    genre: 'Спорт',
    price: 4700,
    image: 'assets/images/blue_lock.jpg',
  ),
];

// Сюда складываем id манги, добавленной в избранное.
List<String> favoriteIds = [];
