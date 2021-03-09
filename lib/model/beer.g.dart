// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Beer _$BeerFromJson(Map<String, dynamic> json) {
  return Beer(
    name: json['name'] as String,
    tagline: json['tagline'] as String,
    firstBrewed: json['first_brewed'] as String,
    imageUrl: json['image_url'] as String,
    brewersTips: json['brewers_tips'] as String,
    contributedBy: json['contributed_by'] as String,
    description: json['description'] as String,
    foodPairing:
        (json['food_pairing'] as List)?.map((e) => e as String)?.toList(),
  );
}
