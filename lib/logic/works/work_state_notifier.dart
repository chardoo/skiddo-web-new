import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skiddo_web/logic/works/work_state.dart';
import 'package:skiddo_web/services/Api/works/works.dart';

class SampleNotifier extends StateNotifier<SampleState> {
  SampleNotifier({required WorkEndpoint workEndpoint})
      : _workEndpoint = workEndpoint,
        super(const SampleState.initial());

  final WorkEndpoint _workEndpoint;
  Future<void> getWorks(dynamic payload) async {
    state = const SampleState.loading();

    try {
      final sample = await _workEndpoint.getSample(payload);
      state = SampleState.data(sample: sample);
    } catch (_) {
      state = const SampleState.error('Error!');
    }
  }
}
