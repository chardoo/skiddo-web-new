import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skiddo_web/logic/works/work_state.dart';
import 'package:skiddo_web/logic/works/work_state_notifier.dart';
import 'package:skiddo_web/services/Api/works/works.dart';

final sampleNotifierProvider =
    StateNotifierProvider<SampleNotifier, SampleState>(
        (ref) => SampleNotifier(workEndpoint: ref.watch(_getJokeProvider)));

final _getJokeProvider = Provider<WorkEndpoint>(
  (ref) => WorkEndpoint(),
);
