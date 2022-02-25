import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nutri_control/services/services.dart';
import 'package:provider/provider.dart';



class CardSwiper extends StatelessWidget {

  const CardSwiper({
    Key? key,
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    final alimentosService= Provider.of<AlimentosService>(context);
    final movies=alimentosService.comidas;
    return SizedBox(
      width: double.infinity,
      height: size.height*0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.6,
        itemHeight: size.height*0.8,
        itemBuilder: (_, int index){
          
          final movie =movies[index];
          return  ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.imagen),
              fit: BoxFit.cover,
              ),
          );
        },

      ),
    );
  }
}