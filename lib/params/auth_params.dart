class AuthParams {
  final String email;
  final String password;
  final String? name;
  final String? passwordConfirmation;

  const AuthParams({
    required this.email,
    required this.password,
    this.name,
    this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "password_confirmation": passwordConfirmation,
      };
}
