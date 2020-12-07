class Constants {
  static const String _apiKey = 'f7d5656ce8aad4024ebe7ae95210ab54';
  static const String _baseURL = 'https://gateway.marvel.com';
  static const String _hash = 'deead2596707209e6541e692e10304fc';
  static const String _ts = '1';
  static const String characters =
      '$_baseURL/v1/public/characters?name={name}&ts=$_ts&apikey=$_apiKey&hash=$_hash';
  static const String imageCharacter = '{path}/portrait_fantastic.{extension}';
  static const String charactersList =
      '$_baseURL/v1/public/characters?ts=$_ts&apikey=$_apiKey&hash=$_hash';
}
