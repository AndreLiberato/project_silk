import 'package:vish/data/categories.dart';

import '../models/product.dart';

final List<Product> products = [
  Product(
      description:
          "Maçã gala nacional, produzida nas terras fantásticas. Nutritiva e suculenta.",
      id: "1",
      name: "Maçã Gala Nacional",
      measure: "1Kg",
      imageUrl: "https://d3ugyf2ht6aenh.cloudfront.net/stores/746/397/products/maca-gala1-1e5fb8f95f2e6d251a15221697061927-1024-1024.jpg",
      price: 4.99,
      categories: [2]),
  Product(
    description:
        "Banana prata, produzida nas terras fantásticas. Nutritiva e suculenta.",
    id: "2",
    name: "Banana Prata",
    measure: "1Kg",
    imageUrl:
        "https://ceagesp.gov.br/wp-content/uploads/2019/12/Banana_pratapng.png",
    price: 3.99,
    categories: [2],
  ),
  Product(
    description:
        "Uva sem semente, produzida nas terras fantásticas. Nutritiva e suculenta.",
    id: "3",
    name: "Uva sem semente",
    measure: "1Kg",
    imageUrl:
        "https://d3ugyf2ht6aenh.cloudfront.net/stores/746/397/products/uva-brs-isis-sem-semente1-4117fb3e4898b50a5a16102264065112-1024-1024.jpg",
    price: 7.99,
    categories: [2],
  ),
  Product(
    description: "Feijão carioca camil. Facil cozimento",
    id: "4",
    name: "Feijão carioca camil",
    measure: "1Kg",
    imageUrl: "https://m.media-amazon.com/images/I/61vDdGXuRwL._AC_SX569_.jpg",
    price: 8.99,
    categories: [3],
  ),
  Product(
    description: "Arroz branco tio urbano",
    id: "5",
    name: "Arroz branco tio urbano",
    measure: "1Kg",
    imageUrl:
        "https://www.glutenpraque.com.br/wp-content/uploads/2022/06/10939011986_Urbano_Arroz20branco.png",
    price: 5.99,
    categories: [3],
  ),
  Product(
    description: "Cerveja puro malte pilsen eisenbahn",
    id: "6",
    name: "Cerveja Eisenbahn lata",
    measure: "1un",
    imageUrl: "https://static.clubeextra.com.br/img/uploads/1/579/24474579.jpg",
    price: 3.99,
    categories: [1, 4],
  ),
  Product(
    description: "Cerveja puro malte lager Heineken",
    id: "7",
    name: "Cerveja Heineken 330ml",
    measure: "1un",
    imageUrl:
        "https://www.imigrantesbebidas.com.br/bebida/images/products/full/222-cerveja-heineken-long-neck-330ml.jpg",
    price: 3.99,
    categories: [1, 4],
  ),
  Product(
    description: "Água mineral crystal sem gás 500ml",
    id: "7",
    name: "Água mineral crystal 500ml",
    measure: "un",
    imageUrl:
        "https://http2.mlstatic.com/D_NQ_NP_800831-MLU47587972258_092021-O.jpg",
    price: 1.99,
    categories: [1],
  ),
];
