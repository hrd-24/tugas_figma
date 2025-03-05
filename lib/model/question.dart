// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {
  final String pertanyaan;
  final int kj;
  final List<String> pg;
  Question({
    required this.pertanyaan,
    required this.kj,
    required this.pg,
  });

  Question copyWith({
    String? pertanyaan,
    int? kj,
    List<String>? pg,
  }) {
    return Question(
      pertanyaan: pertanyaan ?? this.pertanyaan,
      kj: kj ?? this.kj,
      pg: pg ?? this.pg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pertanyaan': pertanyaan,
      'kj': kj,
      'pg': pg,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      pertanyaan: map['pertanyaan'] as String,
      kj: map['kj'] as int,
      pg: List<String>.from((map['pg'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Question(pertanyaan: $pertanyaan, kj: $kj, pg: $pg)';

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;
  
    return 
      other.pertanyaan == pertanyaan &&
      other.kj == kj &&
      listEquals(other.pg, pg);
  }

  @override
  int get hashCode => pertanyaan.hashCode ^ kj.hashCode ^ pg.hashCode;
}
