////const String apiKey = 'Your Key';
////1
//const String catAPIURL = 'http://188.166.24.214/data.php?key=group4&time=24';
//// 2
////const String catImageAPIURL = 'https://api.thecatapi.com/v1/images/search?';
//// 3
////const String breedString = 'breed_id=';
//
//// 4
////const String apiKeyString = 'x-api-key=$apiKey';
//
//class WeatherAPI {
//  // 5
//  Future<dynamic> getCatBreeds() async {
//    // 6
//    Network network = Network('$catAPIURL$apiKeyString');
//    // 7
//    var catData = await network.getData();
//    return catData;
//  }
//  // 8
//  Future<dynamic> getCatBreed(String breedName) async {
//    Network network =
//    Network('$catImageAPIURL$breedString$breedName&$apiKeyString');
//    var catData = await network.getData();
//    return catData;
//  }
//}