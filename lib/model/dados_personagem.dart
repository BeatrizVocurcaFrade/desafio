class DadosPersonagem {
  String nome;
  String altura;
  String massa;
  String anoNascimento;
  
  DadosPersonagem(
      {required this.nome,
      required this.altura,
      required this.massa,
      required this.anoNascimento,
     });

  factory DadosPersonagem.fromJson(Map<String, dynamic> json) {
    return DadosPersonagem(
      nome: json['name'] ?? "",
      massa: json['mass'] ?? "<Sem massa>",
      anoNascimento: json['birth_year'] ?? "<Sem ano nascimento>",
      altura: json['height'] ?? "<Sem altura>",
      );     
  }

}