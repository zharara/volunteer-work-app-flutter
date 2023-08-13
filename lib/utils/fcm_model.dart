class FCMModel {
  final num? itemId;
  final FirebaseMessagePageEnum? page;

  FCMModel({
    required this.itemId,
    required this.page,
  });

  factory FCMModel.fromJson(Map<String, dynamic> json) =>
      _$FCMModelFromJson(json);

  static const fromJsonFactory = _$FCMModelFromJson;
  static const toJsonFactory = _$FCMModelToJson;

  Map<String, dynamic> toJson() => _$FCMModelToJson(this);
}

extension $FCMModelExtension on FCMModel {
  FCMModel copyWith({
    num? itemId,
    FirebaseMessagePageEnum? page,
  }) {
    return FCMModel(
      itemId: itemId ?? this.itemId,
      page: page ?? this.page,
    );
  }
}

enum FirebaseMessagePageEnum {
  home,
  notification,
  chats,
  studentApplication,
}

FCMModel _$FCMModelFromJson(Map<String, dynamic> json) => FCMModel(
      itemId: int.tryParse(json['itemId']),
      page: firebaseMessagePageEnumFromJson(int.tryParse(json['page'])),
    );

Map<String, dynamic> _$FCMModelToJson(FCMModel instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'page': firebaseMessagePageEnumToJson(instance.page),
    };

const $FirebaseMessagePageMap = {
  FirebaseMessagePageEnum.home: 0,
  FirebaseMessagePageEnum.notification: 1,
  FirebaseMessagePageEnum.chats: 2,
  FirebaseMessagePageEnum.studentApplication: 3,
};

int? firebaseMessagePageEnumToJson(
    FirebaseMessagePageEnum? firebaseMessagePageEnum) {
  return $FirebaseMessagePageMap[firebaseMessagePageEnum];
}

FirebaseMessagePageEnum firebaseMessagePageEnumFromJson(
    int? firebaseMessagePageEnum) {
  return $FirebaseMessagePageMap.entries
      .firstWhere((element) => element.value == firebaseMessagePageEnum,
          orElse: () => const MapEntry(FirebaseMessagePageEnum.home, 0))
      .key;
}
