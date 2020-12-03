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
    if (validations.nameIsValid(name)) {
      Profile completeProfile = await database.createProfile(profile);
      return completeProfile;
    } else {
      return null;
    }
  }

  void deleteProfile(Profile profile) {
    database.deleteProfile(profile);
  }

  void loadProfiles() {}

  void changeProfile() {}

  void currentProfile() {}
}
