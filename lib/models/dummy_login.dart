class DummyLogin {
  final String email;
  final String password;
  final String name;

  DummyLogin({
    required this.email,
    required this.password,
    required this.name,
  });
}

final List<DummyLogin> dummyLoginList = [
  DummyLogin(
    email: 'testing@gmail.com',
    password: 'password',
    name: 'testing',
  ),
];
