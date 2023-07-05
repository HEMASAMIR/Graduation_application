import 'package:hive/hive.dart';

class UserDatabase {
  UserDatabase._privateConstructor();

  static final UserDatabase _instance = UserDatabase._privateConstructor();

  static UserDatabase get instance => _instance;

  late Box user_data_box;

  late String email;

  late String userName;
  late bool userRegistered;
  late String id;
  late String imageUrl;
  late String status;
  late String phoneNumber;

  String _key_email = "email";
  String _key_userDatabaseBox = "user_box";
  String _key_phoneNumber = "phone";
  String _key_imageUrl = "imageUrl";
  String _key_id = "id";
  String _key_status = "status";
  String _key_userRegistered = 'user_registered';
  String _key_userName = "userName";

  Future<void> initUserInfo() async {
    await Hive.openBox(_key_userDatabaseBox).then((value) {
      user_data_box = value;
      userRegistered =
          user_data_box.get(_key_userRegistered, defaultValue: false);
      userName = user_data_box.get(_key_userName, defaultValue: '');
      email = user_data_box.get(_key_email, defaultValue: '');
      id = user_data_box.get(_key_id, defaultValue: '');
      phoneNumber = user_data_box.get(_key_phoneNumber, defaultValue: '');
      status = user_data_box.get(_key_status, defaultValue: '');
      imageUrl = user_data_box.get(_key_imageUrl, defaultValue: '');
    });
  }

  Future<void> setEmail({required String email}) async {
    this.email = email;
    await user_data_box.put(_key_email, email);
  }

  Future<void> setId({required String id}) async {
    this.id = id;
    await user_data_box.put(_key_id, id);
  }

  Future<void> setUserName({required String userName}) async {
    this.userName = userName;
    await user_data_box.put(_key_userName, userName);
  }

  Future<void> setPhoneNumber({required String phoneNumber}) async {
    this.phoneNumber = phoneNumber;
    await user_data_box.put(_key_phoneNumber, phoneNumber);
  }

  Future<void> setStatus({required String status}) async {
    this.status = status;
    await user_data_box.put(_key_status, status);
  }

  Future<void> setImageUrl({required String imageUrl}) async {
    this.imageUrl = imageUrl;
    await user_data_box.put(_key_imageUrl, imageUrl);
  }

  Future<void> setUserRegistered({required bool userRegistered}) async {
    this.userRegistered = userRegistered;
    await user_data_box.put(_key_userRegistered, userRegistered);
  }

  /**
   * Getters .
   */
  String get getId => this.id;
  String get getUserName => this.userName;
  String get getEmail => this.email;
  String get getPhoneNumber => this.phoneNumber;
  String get getStatus => this.status;
  String get getImageUrl => this.imageUrl;
  bool get getUserRegistered => this.userRegistered;
}
