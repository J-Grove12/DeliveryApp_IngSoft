import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdenRecord extends FirestoreRecord {
  OrdenRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Entregada" field.
  bool? _entregada;
  bool get entregada => _entregada ?? false;
  bool hasEntregada() => _entregada != null;

  // "Carrito" field.
  DocumentReference? _carrito;
  DocumentReference? get carrito => _carrito;
  bool hasCarrito() => _carrito != null;

  // "Usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "MetodoPago" field.
  String? _metodoPago;
  String get metodoPago => _metodoPago ?? '';
  bool hasMetodoPago() => _metodoPago != null;

  void _initializeFields() {
    _entregada = snapshotData['Entregada'] as bool?;
    _carrito = snapshotData['Carrito'] as DocumentReference?;
    _usuario = snapshotData['Usuario'] as DocumentReference?;
    _metodoPago = snapshotData['MetodoPago'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Orden');

  static Stream<OrdenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdenRecord.fromSnapshot(s));

  static Future<OrdenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdenRecord.fromSnapshot(s));

  static OrdenRecord fromSnapshot(DocumentSnapshot snapshot) => OrdenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdenRecordData({
  bool? entregada,
  DocumentReference? carrito,
  DocumentReference? usuario,
  String? metodoPago,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Entregada': entregada,
      'Carrito': carrito,
      'Usuario': usuario,
      'MetodoPago': metodoPago,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdenRecordDocumentEquality implements Equality<OrdenRecord> {
  const OrdenRecordDocumentEquality();

  @override
  bool equals(OrdenRecord? e1, OrdenRecord? e2) {
    return e1?.entregada == e2?.entregada &&
        e1?.carrito == e2?.carrito &&
        e1?.usuario == e2?.usuario &&
        e1?.metodoPago == e2?.metodoPago;
  }

  @override
  int hash(OrdenRecord? e) => const ListEquality()
      .hash([e?.entregada, e?.carrito, e?.usuario, e?.metodoPago]);

  @override
  bool isValidKey(Object? o) => o is OrdenRecord;
}
