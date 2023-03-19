import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/meditation/bloc/meditation_bloc.dart';
import 'package:mbl/features/widget/list-item.widget.dart';
import 'package:mbl/themes/themes.dart';


class MeditationSuccess extends StatelessWidget {
  const MeditationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeditationBloc, MeditationState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: StandardColor.primary,
          body: /*ListView.builder(
            itemCount: state.medias.length,
            itemBuilder: (BuildContext context, int index ) {
              return Center(
                child: ListItem(itemName: 'List Item',),
                );
              }
            ),*/
          Center(child: ListItem(itemName: 'List Item',),),
        );
      },
    );
  }
}


