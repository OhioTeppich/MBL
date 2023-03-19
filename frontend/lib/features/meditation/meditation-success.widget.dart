import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/meditation/bloc/meditation_bloc.dart';
import 'package:mbl/features/widget/list-item.widget.dart';
import 'package:mbl/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class MeditationSuccess extends StatelessWidget {
  const MeditationSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeditationBloc, MeditationState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        switch (state.status) {
          case MeditationStatus.loading:
            return const Center(
              child: CircularProgressIndicator(color: StandardColor.accentPrimaryButton,),
            );
          case MeditationStatus.success:
            return Scaffold(
            backgroundColor: StandardColor.primary,
            body: /*ListView.builder(
              itemCount: state.medias.length,
              itemBuilder: (BuildContext context, int index ) {
                return Center(
                  child: ListItem(itemName: 'List Item',),
                  );
                }
              ),*/
            Center(child: ListItem(itemName: state.meditations.first.title ?? 'Error',),
            ),
          );
         case MeditationStatus.error:
            return ErrorWidget(AppLocalizations.of(context)!.errorWidgetLabel);
          case MeditationStatus.initial:
            return const Text('');
          default:
            return const Text('');
        }
        
      },
    );
  }
}
