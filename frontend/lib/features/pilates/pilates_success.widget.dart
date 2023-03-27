import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mbl/features/pilates/bloc/pilates_cubit.dart';
import 'package:mbl/features/widget/list_view_icon.widget.dart';
import 'package:mbl/themes/themes.dart';

class PilatesSuccess extends StatelessWidget {
  const PilatesSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PilatesBloc, PilatesState>(
      builder: (context, state) {
        switch (state.status) {
          case PilatesStatus.loading:
            return const Center(
              child: Text('loading'),
            );
          case PilatesStatus.success:
            return Scaffold(
              backgroundColor: StandardColor.primary,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Pilates',
                  style: StandardText.headline3
                      .copyWith(color: StandardColor.headlineAccent),
                ),
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      context.read<PilatesCubit>().switchState();
                    },
                    child: BlocBuilder<PilatesCubit, PilatesState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            state.view
                                ? const ListViewIcons(
                                    grid: StandardColor.accent,
                                    list: StandardColor.textColor,
                                  )
                                : const ListViewIcons(
                                    grid: StandardColor.textColor,
                                    list: StandardColor.accent,
                                  )
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
              body: BlocBuilder<PilatesCubit, PilatesState>(
                builder: (context, state) {
                  return state.view
                      ? const Text('List View')
                      : const Text('Grid View');
                },
              ),
            );
          case PilatesStatus.error:
            return ErrorWidget(AppLocalizations.of(context)!.errorWidgetLabel);
          case PilatesStatus.initial:
            return const Text('');
          default:
            return const Text('');
        }
      },
    );
  }
}
