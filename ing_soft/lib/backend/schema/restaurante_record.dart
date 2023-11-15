import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestauranteRecord extends FirestoreRecord {
  RestauranteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Direccion" field.
  LatLng? _direccion;
  LatLng? get direccion => _direccion;
  bool hasDireccion() => _direccion != null;

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  void _initializeFields() {
    _direccion = snapshotData['Direccion'] as LatLng?;
    _nombre = snapshotData['Nombre'] as String?;
    _logo = snapshotData['Logo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Restaurante');

  static Stream<RestauranteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestauranteRecord.fromSnapshot(s));

  static Future<RestauranteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestauranteRecord.fromSnapshot(s));

  static RestauranteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestauranteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestauranteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestauranteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestauranteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestauranteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestauranteRecordData({
  LatLng? direccion,
  String? nombre,
  String? logo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Direccion': direccion,
      'Nombre': nombre,
      'Logo': logo,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestauranteRecordDocumentEquality implements Equality<RestauranteRecord> {
  const RestauranteRecordDocumentEquality();

  @override
  bool equals(RestauranteRecord? e1, RestauranteRecord? e2) {
    return e1?.direccion == e2?.direccion &&
        e1?.nombre == e2?.nombre &&
        e1?.logo == e2?.logo;
  }

  @override
  int hash(RestauranteRecord? e) =>
      const ListEquality().hash([e?.direccion, e?.nombre, e?.logo]);

  @override
  bool isValidKey(Object? o) => o is RestauranteRecord;
}
