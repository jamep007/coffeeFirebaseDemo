class AnonUser {
  final String uid;

  AnonUser({this.uid});
}

class EmailAndPassUser {
  final String uid;

  EmailAndPassUser({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({this.uid, this.name, this.sugars, this.strength});
}
