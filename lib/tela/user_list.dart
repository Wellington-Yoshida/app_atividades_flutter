import 'package:app_atividade/component/centered_message.dart';
import 'package:app_atividade/component/progress.dart';
import 'package:app_atividade/service/http/service_usuario.dart';
import 'package:app_atividade/usuario_dto.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {

  UsarioService usuarioService = new UsarioService();

  @override
  State<StatefulWidget> createState() {
    return _UserListState();
  }

}

class _UserListState extends State<UserList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
      ),
      body: FutureBuilder<List<UsuarioDTO>>(
        future: widget.usuarioService.findAllUser(),
        builder: (context, snapshopt) {
          switch(snapshopt.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<UsuarioDTO> usuarioDTO = snapshopt.data;
              if (snapshopt.hasData) {
                if (usuarioDTO.isNotEmpty) {
                  return ListView.builder(
                    itemCount: usuarioDTO.length,
                    itemBuilder: (context, indice) {
                      return _UserCard(usuarioDTO[indice]);
                    },
                  );
                }
              }
              return CenteredMessage('No User found', icon: Icons.warning,);
              break;
          }
          return CenteredMessage('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

}

class _UserCard extends StatelessWidget {

  final UsuarioDTO _usuarioDTO;

  _UserCard(this._usuarioDTO);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(_usuarioDTO.nome),
      ),
    );
  }

}