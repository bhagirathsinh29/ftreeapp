// To parse this JSON data, do
//
//     final FamilyModelClass = familyModelClassFromJson(jsonString);

import 'dart:convert';

FamilyModelClass familyModelClassFromJson(String str) =>
    FamilyModelClass.fromJson(json.decode(str));

String familyModelClassToJson(FamilyModelClass data) =>
    json.encode(data.toJson());

class FamilyModelClass {
  FamilyModelClass({
    required this.nodes,
  });

  final List<Node> nodes;

  factory FamilyModelClass.fromJson(Map<String, dynamic> json) =>
      FamilyModelClass(
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class Node {
  Node({
    required this.id,
    required this.label,
    required this.partner,
  });

  final String id;
  final String label;
  final String partner;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        label: json["label"],
        partner: json["partner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "partner": partner,
      };
}
