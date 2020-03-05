import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modern_academy/base/BaseUser.dart';

class AppComfig {
  AppComfig._internal() {}
  static final AppComfig shared = AppComfig._internal();

  BaseUser currentuser;
  static DocumentSnapshot userOnlineMap = null; 

  setCurrentUser(BaseUser user) {
    this.currentuser = user;
  }

  BaseUser getCurrentUser() {
    return this.currentuser;
  }
}
