import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/meditation/bloc/meditation_bloc.dart';
import 'package:mbl/features/meditation/bloc/meditation_cubit.dart';
import 'package:mbl/features/widget/list_view_icon.widget.dart';
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
              child: CircularProgressIndicator(
                color: StandardColor.accentPrimaryButton,
              ),
            );
          case MeditationStatus.success:
            return Scaffold(
              backgroundColor: StandardColor.primary,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Meditation',
                  style: StandardText.headline3
                      .copyWith(color: StandardColor.headlineAccent),
                ),
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      context.read<MeditationCubit>().switchState();
                    },
                    child: BlocBuilder<MeditationCubit, MeditationState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            state.view
                                ? const ListViewIcons(
                                    grid: StandardColor.textColor,
                                    list: StandardColor.accent,
                                  )
                                : const ListViewIcons(
                                    grid: StandardColor.accent,
                                    list: StandardColor.textColor,
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                    color: StandardColor.strokeColor,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.filter_alt,
                      color: StandardColor.accent,
                    ),
                  ),
                ],
              ),
              body: BlocBuilder<MeditationCubit, MeditationState>(
                builder: (context, state) {
                  return state.view
                      ? const Text('Grid View')
                      : const Text('List View');
                },
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
