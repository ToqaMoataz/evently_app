class EventModel {
  String id; // Firestore document ID
  String eventCategory;
  String title;
  String description;
  int date;
  String time;
  String location;

  EventModel({
    this.id = "", // default empty if not set
    required this.eventCategory,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
  });

  /// Convert Firestore JSON → EventModel
  static EventModel fromJson(Map<String, dynamic> json, {String id = ""}) {
    return EventModel(
      id: id,
      eventCategory: json['eventCategory'],
      title: json['title'] as String,
      description: json['description'],
      date: json['date'] ,
      time: json['time'],
      location: json['location'],
    );
  }

  /// Convert EventModel → Firestore JSON
  Map<String, dynamic> toJson() {
    return {
      'eventCategory': eventCategory,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'location': location,
    };
  }
}
