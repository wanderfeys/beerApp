import 'package:json_annotation/json_annotation.dart';

part 'beer.g.dart';

//Creates modal for beer with json_serializable
@JsonSerializable(createFactory: true, createToJson: false, nullable: true)
class Beer {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "tagline")
  String tagline;
  @JsonKey(name: "first_brewed")
  String firstBrewed;
  @JsonKey(name: "image_url")
  String imageUrl;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "food_pairing")
  List<String> foodPairing;
  @JsonKey(name: "brewers_tips")
  String brewersTips;
  @JsonKey(name: "contributed_by")
  String contributedBy;

  Beer(
      {this.name,
      this.tagline,
      this.firstBrewed,
      this.imageUrl,
      this.brewersTips,
      this.contributedBy,
      this.description,
      this.foodPairing});

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);
}
