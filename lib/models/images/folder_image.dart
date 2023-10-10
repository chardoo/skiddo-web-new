
class Folder {
  final String eventName;
  final String url;
  final String id;
  final String eventDate;

  Folder({required this.eventName, required this.eventDate, required this.url, required this.id});

  factory Folder.fromMap(Map<String, dynamic> json) {
    return Folder(eventName: json["eventName"], url: json["url"], id: json['id'], eventDate: json["eventDate"]);
  }

  @override
  String toString() {
    return "{ id:  eventName: $eventName  url: $url  id: $id}";
  }
}

class Sample {
  final String imageId;
  final String url;
  final String id;


  Sample({required this.imageId,required this.url, required this.id});

  factory Sample.fromMap(Map<String, dynamic> json) {
    return Sample(imageId: json["imageId"], url: json["url"], id: json['id']);
  }

  @override
  String toString() {
    return "{  url: $url  id: $id}";
  }
}

class EventImages {
  final String id;
  final String url;
  final String imageId;
  final int price;
  EventImages({required this.id, required this.price, required this.imageId,  required this.url});

  factory EventImages.fromMap(Map<String, dynamic> json) {
    return EventImages( id: json["id"], url: json["url"], price: int.parse( json["price"]), imageId: json["imageId"]);
  }

  @override
  String toString() {
    return "{ id:  $id price: $price  url: $url}";
  }
}