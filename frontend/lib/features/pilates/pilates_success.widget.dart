import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbl/features/pilates/bloc/pilates_bloc.dart';
import 'package:mbl/features/shared/collection/collection.widget.dart';
import 'package:mbl/features/shared/collection/collection_header.widget.dart';
import 'package:mbl/features/shared/collection/collection_item.model.dart';
import 'package:mbl/features/shared/list_grid_switch/list_grid_switch.settings.dart';
import 'package:mbl/l10n/l10n.dart';
import 'package:mbl/themes/themes.dart';
import 'package:mbl/repository/models/image.model.dart' as model;

class PilatesSuccess extends StatelessWidget {
  const PilatesSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<PilatesBloc, PilatesState>(
      listenWhen: (previous, current) => current.reachedMaxPages,
      listener: (context, state) {
        showSnackBar(context);
      },
      builder: (context, state) {
        switch (state.status) {
          case PilatesStatus.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: StandardColor.accentPrimaryButton,
              ),
            );
          case PilatesStatus.success:
            return Scaffold(
              backgroundColor: StandardColor.primary,
              appBar: CollectionHeader(
                title: l10n.pilates,
                listGridSwitchSettings: ListGridSwitchSettings(
                  (viewMode) {
                    context.read<PilatesBloc>().add(ToggleViewMode(viewMode));
                  },
                  state.viewMode,
                ),
              ),
              body: Collection(
                viewMode: state.viewMode,
                totalItems: state.metaData.pagination.total,
                pageSize: state.metaData.pagination.pageSize,
                items: List.from(
                  state.pilatesExercises.map((item) {
                    // Null abfrage für youtube video hinzufügen
                    final ytId = item.url?.split('=').last;
                    final ytImageUrl = ytId == null
                        ? null
                        : 'https://img.youtube.com/vi/$ytId/maxresdefault.jpg';
                    return CollectionItemModel(
                      item.title,
                      Icons.videocam,
                      item.image?.id != null
                          ? item.image
                          : model.Image(0, ytImageUrl),
                      item.title,
                      () {
                        // add when video player is ready
                        // context.read<PilatesBloc>().add( navigate to audio or video player );
                      },
                    );
                  }),
                ),
                contentType: ContentType.video,
                loadMoreCallback: () {
                  context.read<PilatesBloc>().add(GetPilatesExercises());
                },
              ),
            );
          case PilatesStatus.error:
            return Center(child: Text(l10n.errorWidgetLabel));
          case PilatesStatus.initial:
            return const Text('');
          default:
            return const Text('');
        }
      },
    );
  }
}

void showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: Center(
      child: Text(
        'No more enteries',
        style: StandardText.captionBold,
      ),
    ),
    backgroundColor: StandardColor.accent,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
