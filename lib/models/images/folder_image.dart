import 'package:freezed_annotation/freezed_annotation.dart';
part '.generated/folder_image.freezed.dart';
part ".generated/folder_image.g.dart";

@freezed
class Folder with _$Folder {
  factory Folder(
      {required String eventName,
      required String eventDate,
      required String url,
      required String id}) = _Folder;

  // factory Folder.fromMap(Map<String, dynamic> json) {
  //   return Folder(eventName: json["eventName"], url: json["url"], id: json['id'], eventDate: json["eventDate"]);
  // }
  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  // @override
  // String toString() {
  //   return "{ id:  eventName: $eventName  url: $url  id: $id}";
  // }
}

@freezed
class Sample with _$Sample {
  factory Sample(
      {required String imageId,
      required String url,
      required String id}) = _Sample;

  // factory Sample.fromMap(Map<String, dynamic> json) {
  //   return Sample(imageId: json["imageId"], url: json["url"], id: json['id']);
  // }

  // @override
  // String toString() {
  //   return "{  url: $url  id: $id}";
  // }
  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);
}
@freezed
class EventImages with _$EventImages {
  factory
  EventImages(
      {required String id,
      required String price,
      required String imageId,
      required String url}) =  _EventImages;


  factory EventImages.fromJson(Map<String, dynamic> json) => _$EventImagesFromJson(json);
 
}
