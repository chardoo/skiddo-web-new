// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../folder_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderImpl _$$FolderImplFromJson(Map<String, dynamic> json) => _$FolderImpl(
      eventName: json['eventName'] as String,
      eventDate: json['eventDate'] as String,
      url: json['url'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$FolderImplToJson(_$FolderImpl instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'eventDate': instance.eventDate,
      'url': instance.url,
      'id': instance.id,
    };

_$SampleImpl _$$SampleImplFromJson(Map<String, dynamic> json) => _$SampleImpl(
      imageId: json['imageId'] as String,
      url: json['url'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$SampleImplToJson(_$SampleImpl instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'url': instance.url,
      'id': instance.id,
    };

_$EventImagesImpl _$$EventImagesImplFromJson(Map<String, dynamic> json) =>
    _$EventImagesImpl(
      id: json['id'] as String,
      price: json['price'] as String,
      imageId: json['imageId'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$EventImagesImplToJson(_$EventImagesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'imageId': instance.imageId,
      'url': instance.url,
    };
