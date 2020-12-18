import 'package:shared_preferences/shared_preferences.dart';

import '../database/database_provider.dart';
import '../models/account.dart';
import '../models/profile.dart';
import '../utils/validations.dart';

class ProfileService {
  final DatabaseProvider database = DatabaseProvider.db;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Validations validations = Validations();

  Future<Profile> createProfile(Account account, String name) async {
    Profile profile = Profile(name, account.id, false);

    Profile completeProfile = await database.createProfile(profile);

    SharedPreferences prefs = await _prefs;
    prefs.setString('name', profile.name);

    return completeProfile;
  }

  Future<bool> deleteProfile(Profile profile) async {
    if (profile.main) {
      return false;
    } else {
      await database.deleteProfile(profile);
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
    SharedPreferences prefs = await _prefs;
    Profile newProfile = await database.changeProfile(profile);

    prefs.setString('name', newProfile.name);

    return newProfile;
  }

  Future<Profile> currentProfile(Account account) async {
    SharedPreferences prefs = await _prefs;

    String nameProfile = prefs.getString('name');

    Profile profile = await database.currentProfile(account, nameProfile);

    return profile;
  }

  Future<Profile> getMainProfile(Account account) async {
    SharedPreferences prefs = await _prefs;
    Profile profile = await database.getMainProfile(account);

    if (profile != null) {
      prefs.setString('name', profile.name);
      return profile;
    } else {
      return null;
    }
  }
}
