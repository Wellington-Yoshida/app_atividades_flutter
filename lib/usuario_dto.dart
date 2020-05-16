class UsuarioDTO {

  String _nome;
  int _id;

  UsuarioDTO(nome, [id]) {
    this._nome = nome;
    this._id = id;
  }

  String get nome {
    return _nome;
  }

  void set nome(String nome) {
    _nome = nome;
  }

  int get id {
    return id;
  }

  void set id(int id) {
    _id = id;
  }

}