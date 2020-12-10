import 'package:shared_preferences/shared_preferences.dart';

import '../database/database_provider.dart';
import '../models/account.dart';
import '../models/profile.dart';
import '../utils/validations.dart';

class ProfileService {
  final DatabaseProvider database = DatabaseProvider.db;
  SharedPreferences _prefs;
  Validations validations = Validations();

  Future<Profile> createProfile(Account account, String name) async {
    Profile profile = Profile(name, account.id, false);

    Profile completeProfile = await database.createProfile(profile);
    return completeProfile;
  }

  bool deleteProfile(Profile profile) {
    if (profile.main) {
      return false;
    } else {
      database.deleteProfile(profile);
      return true;
    }
  }

  Future<List<Profile>> loadProfiles(Account account) async {
    List<Profile> profilesList = await database.loadProfiles(account);
    if (profilesList.isNotEmpty) {
      return profilesList;
    } else {
      return profilesList;
    }
  }

  Future<Profile> changeProfile(Profile profile) async {
    _prefs = await SharedPreferences.getInstance();
    Profile newProfile = await database.changeProfile(profile);

    _prefs.setString('name', newProfile.name);
    _prefs.getString('name');

    return newProfile;
  }

  Future<Profile> currentProfile(Account account) async {
    _prefs = await SharedPreferences.getInstance();
    Profile profile = await database.currentProfile(account);

    _prefs.setString('name', profile.name);
    _prefs.getString('name');

    return profile;
  }

  Future<Profile> getMainProfile(Account account) async {
    Profile profile = await database.getMainProfile(account);

    if (profile != null) {
      _prefs.setString('name', profile.name);
      _prefs.getString('name');
      return profile;
    } else {
      return null;
    }
  }
}
