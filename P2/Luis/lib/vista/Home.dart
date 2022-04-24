import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:twitter/modelo/usuario.dart';

class Home extends StatefulWidget{

  late List<Usuario> _listaUsuarios;

  Home(List<Usuario> lista){
    _listaUsuarios = lista;
  }

  @override
  _HomeState createState() => _HomeState();

  int numeroDePublicaciones(){
    return 3;
  }

}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _postsListView(widget.numeroDePublicaciones(), context);
    
  }
}

Widget _postsListView(int numPub, BuildContext context) {
    return ListView.builder(
        itemCount: numPub,
        itemBuilder: (context, index) {
          return _postView(context);
        });
  }



Widget _postView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(context),
        _postImage(),
        _postCaption(),
      ],
    );
  }

  Widget _postCaption() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
          'Welcome to the Kilo Loco YouTube channel, where we cover iOS, Flutter, and Android development. The perfect place for explarative mobile devlopers.'),
    );
  }

    Widget _postImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: _dummyImage,
      ),
    );
  }

  Widget _postAuthorRow(BuildContext context) {
    const double avatarDiameter = 44;
    return GestureDetector(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter / 2),
                child: CachedNetworkImage(
                  imageUrl: _dummyAvatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Text(
            'Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  final _dummyAvatar =
      'https://static.wikia.nocookie.net/inuyasha/images/b/b5/Inuyasha.png/revision/latest?cb=20151128185518';
  final _dummyImage =
      'https://i1.wp.com/butwhythopodcast.com/wp-content/uploads/2020/09/maxresdefault-28.jpg?fit=1280%2C720&ssl=1';
