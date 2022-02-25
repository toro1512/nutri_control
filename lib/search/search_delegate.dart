
import 'package:flutter/material.dart';
import 'package:nutri_control/models/models.dart';
import 'package:nutri_control/services/services.dart';
import 'package:nutri_control/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AlimentosSearchDelegate extends SearchDelegate{

  @override
  
  String? get searchFieldLabel => 'Buscar Alimentos';


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
    IconButton(
      onPressed: ()=> query ='',
      icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: ()=> close(context, null),
      icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  Widget _emptyContainer(){
    return const Center(
      child: Icon(Icons.movie_creation_outlined, size: 150, color: Colors.black38),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if(query.isEmpty) {
      return _emptyContainer();
    }
   final alimentosService = Provider.of<AlimentosService>(context, listen: false ); 
   alimentosService.getSuggestionByQuery(query);
    
   return StreamBuilder(
     stream: alimentosService.suggestionsStream,
     builder: ( _ , AsyncSnapshot<List<Alimentos>> snapshot ){
         
        if (!snapshot.hasData) return _emptyContainer(); 
        final alimentos= snapshot.data!;
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: alimentos.length,
          itemBuilder: ( _ , int index  ) =>  _AlimentosSugeridos(alimento: alimentos[index] ));

     });  

  }
  
}

class _AlimentosSugeridos extends StatelessWidget {

   final Alimentos alimento;
  const _AlimentosSugeridos({
    Key? key, 
    required this.alimento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
                onTap: () => Navigator.pushNamed(context, 'detalleAli', arguments: alimento),
                contentPadding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                tileColor:Colors.red[300],
                title: CustomItemAlimentos(alimento: alimento),
      )
    );/*Container(
            color: Colors.red,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                tileColor: Colors.blue,
                title: Text(alimento.name),
              )
            )
     // shape: ShapeBorder.lerp(a, b, t),)
    
    );*/
  }
}



