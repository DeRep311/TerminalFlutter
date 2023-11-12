// import 'package:my_app/src/Models/FetchData.dart';
// import 'package:my_app/src/Models/UsersModel.dart';

// class UserService {
//   // The user data
//   UsersModel? user;

//   // The constructor
//   UserService() {
//     // Fetch the user data
//     fetchUserData();
//   }

//   // Fetch the user data
//   Future<void> fetchUserData() async {
//     // Fetch the user data from the database
//     Map<String, dynamic>? userData =
//         await fetchUserDataFromDatabase(user!.cedula, user!.pin);

//     if (userData == null) {
//       // If the user data is null, set the user to null
//       user = null;
//       return;
//     }

//     // Create a UsersModel object from the fetched data
//     user = UsersModel.fromJson(userData['data']['user']);
//   }

//   // Get the user data
//   UsersModel? getUser() {
//     return user;
//   }
// }







// import 'package:my_app/src/Models/UsersModel.dart';
// import 'package:my_app/src/Models/UsersModel.dart';

// class UserManager {
//   static final UserManager _instance = UserManager._internal();

//   UsersModel? _currentUser;

//   factory UserManager() {
//     return _instance;
//   }

//   UserManager._internal();

//   UsersModel? get currentUser => _currentUser;

//   set currentUser(UsersModel? user) {
//     _currentUser = user;
//   }

//   bool get isLoggedIn => _currentUser != null;

//   void clearUser() {
//     _currentUser = null;
//   }
// }
