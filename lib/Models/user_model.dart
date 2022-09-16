class UserModel {
  final int userId;
  final String firstName;
  final String lastName;
  final String email;

  UserModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email});
}