




import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skiddo_web/models/images/folder_image.dart';

  part '.generated/work_state.freezed.dart';
///Extension Method for easy comparison
// extension SampleGetters on SampleState {
//   bool get isLoading => this is _SampleStateLoading;
// }

@freezed
abstract class SampleState with _$SampleState {
  ///Initial
  const factory SampleState.initial() = _SampleStateInitial;

  ///Loading
  const factory SampleState.loading() = _SampleStateLoading;

  ///Data
  const factory SampleState.data({required  Sample sample}) = _SampleStateData;

  ///Error
  const factory SampleState.error([String? error]) = _SampleStateError;
}