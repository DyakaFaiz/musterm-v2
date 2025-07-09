class DummyLoginData {
  final String email;
  final String password;

  DummyLoginData({required this.email, required this.password});
}

List<DummyLoginData> dummyLoginList = [
  DummyLoginData(
    email: 'testing@gmail.com',
    password: 'password',
  ),
];
