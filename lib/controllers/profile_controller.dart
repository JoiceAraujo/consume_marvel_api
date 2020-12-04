import 'package:flutter/cupertino.dart';

import '../models/account.dart';
import '../models/profile.dart';
import '../services/account_service.dart';
import '../services/profile_service.dart';

class ProfileController extends ChangeNotifier {
  Profile profile = Profile('Loading', 1, false);
  ProfileState state = ProfileState.undefined;
  List<Profile> profilesList = [];
  ProfileService profileService;

  void init() async {
    state = ProfileState.loading;
    notifyListeners();

    Account account = await AccountService().accountLogged();
    if (account != null) {
      state = ProfileState.ready;

      profilesList = await profileService.loadProfiles(account);
    } else {
      state = ProfileState.undefined;
    }
    notifyListeners();
  }

  void createProfile(Account account, String name) async {
    state = ProfileState.loading;
    notifyListeners();

    profile = await profileService.createProfile(account, name);
    if (profile != null) {
      profilesList.add(profile);

      state = ProfileState.ready;
    } else {
      state = ProfileState.error;
    }
    notifyListeners();
  }

  void deleteProfile(Profile profile) {
    state = ProfileState.loading;
    notifyListeners();

    profileService.deleteProfile(profile);

    state = ProfileState.ready;
    notifyListeners();
  }

  void changeProfile(Profile profile) async {
    state = ProfileState.loading;
    notifyListeners();

    profile = await profileService.changeProfile(profile);

    state = ProfileState.ready;
    notifyListeners();
  }

  void currentProfile(Account account) async {
    state = ProfileState.loading;
    notifyListeners();

    profile = await profileService.currentProfile(account);

    state = ProfileState.ready;
  }
}

enum ProfileState {
  undefined,
  loading,
  ready,
  error,
}
