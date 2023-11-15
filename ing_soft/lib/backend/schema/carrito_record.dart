import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarritoRecord extends FirestoreRecord {
  CarritoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "creador" field.
  DocumentReference? _creador;
  DocumentReference? get creador => _creador;
  bool hasCreador() => _creador != null;

  // "Activo" field.
  bool? _activo;
  bool get activo => _activo ?? false;
  bool hasActivo() => _activo != null;

  // "Valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "ComidasSeleccionada" field.
  List<DocumentReference>? _comidasSeleccionada;
  List<DocumentReference> get comidasSeleccionada =>
      _comidasSeleccionada ?? const [];
  bool hasComidasSeleccionada() => _comidasSeleccionada != null;

  void _initializeFields() {
    _creador = snapshotData['creador'] as DocumentReference?;
    _activo = snapshotData['Activo'] as bool?;
    _valor = castToType<double>(snapshotData['Valor']);
    _comidasSeleccionada = getDataList(snapshotData['ComidasSeleccionada']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Carrito');

  static Stream<CarritoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarritoRecord.fromSnapshot(s));

  static Future<CarritoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarritoRecord.fromSnapshot(s));

  static CarritoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarritoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarritoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarritoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarritoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarritoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarritoRecordData({
  DocumentReference? creador,
  bool? activo,
  double? valor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'creador': creador,
      'Activo': activo,
      'Valor': valor,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarritoRecordDocumentEquality implements Equality<CarritoRecord> {
  const CarritoRecordDocumentEquality();

  @override
  bool equals(CarritoRecord? e1, CarritoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creador == e2?.creador &&
        e1?.activo == e2?.activo &&
        e1?.valor == e2?.valor &&
        listEquality.equals(e1?.comidasSeleccionada, e2?.comidasSeleccionada);
  }

  @override
  int hash(CarritoRecord? e) => const ListEquality()
      .hash([e?.creador, e?.activo, e?.valor, e?.comidasSeleccionada]);

  @override
  bool isValidKey(Object? o) => o is CarritoRecord;
}
