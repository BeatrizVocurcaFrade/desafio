class DadosUser {
  String login;
  String nome;
  String bio;
  String avatarUrl;

  DadosUser(
      {required this.login,
      required this.nome,
      required this.bio,
      required this.avatarUrl});

  factory DadosUser.fromJson(Map<String, dynamic> json) {
    return DadosUser(
      login: json['login'] ?? "",
      nome: json['name'] ?? "<Sem nome>",
      bio: json['bio'] ?? "<Sem biografia>",
      avatarUrl: json['avatar_url'] ??
          "https://cdn-icons-png.flaticon.com/512/25/25231.png",
    );
  }
}