import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/account.dart';
import '../models/profile.dart';
import '../services/account_service.dart';
import '../services/profile_service.dart';

class ProfileController extends ChangeNotifier {
  Profile profile = Profile('Loading', 1, false);
  ProfileState state = ProfileState.undefined;
  List<Profile> profilesList = [];
  ProfileService profileService = ProfileService();

  void init() async {
    state = ProfileState.loading;
    notifyListeners();

    Account account = await AccountService().accountLogged();

    if (account != null) {
      profilesList = await profileService.loadProfiles(account);

      profile = await profileService.getMainProfile(account);

      state = ProfileState.ready;
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
      profileService.currentProfile(account);

      state = ProfileState.ready;
    } else {
      state = ProfileState.error;
    }
    notifyListeners();
  }

  void deleteProfile(Profile deleteProfile) async {
    state = ProfileState.loading;
    notifyListeners();

    Account account = await AccountService().accountLogged();

    if (!deleteProfile.main) {
      Profile currentProfile = await profileService.currentProfile(account);
      if (deleteProfile.name == currentProfile.name) {
        removeProfileFromLocalListAndDataBase(deleteProfile);

        await changeProfile(await profileService.getMainProfile(account));

        state = ProfileState.ready;
      } else {
        removeProfileFromLocalListAndDataBase(deleteProfile);

        state = ProfileState.ready;
      }
    } else {
      state = ProfileState.error;
    }

    notifyListeners();
  }

  void removeProfileFromLocalListAndDataBase(Profile deleteProfile) async {
    profilesList.removeWhere((element) => element == deleteProfile);
    await profileService.deleteProfile(deleteProfile);
  }

  void changeProfile(Profile newProfile) async {
    state = ProfileState.loading;
    notifyListeners();

    profile = await profileService.changeProfile(newProfile);
    print(profile.name);

    state = ProfileState.ready;
    notifyListeners();
  }
}

enum ProfileState {
  undefined,
  loading,
  ready,
  error,
}
