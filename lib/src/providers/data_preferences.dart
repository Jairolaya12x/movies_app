import 'package:shared_preferences/shared_preferences.dart';

class DataPreferences {
  static final DataPreferences _instance = DataPreferences._internal();

  factory DataPreferences() {
    return _instance;
  }

  DataPreferences._internal();

  SharedPreferences _prefs;

  initPreferences() async =>  _prefs = await SharedPreferences.getInstance();

  String _currentUsername;

  String get currentUsername => _currentUsername ?? _prefs.getString('username');

  set currentUserName(String value) {
    _currentUsername = value;
    _prefs.setString('username', value);
  }

  void cleanDataPreferences(){
    _prefs.clear();
    currentUserName = null;
  }


}