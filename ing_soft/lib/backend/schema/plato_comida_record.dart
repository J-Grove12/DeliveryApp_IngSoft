import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlatoComidaRecord extends FirestoreRecord {
  PlatoComidaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Nombre_Restaurante" field.
  String? _nombreRestaurante;
  String get nombreRestaurante => _nombreRestaurante ?? '';
  bool hasNombreRestaurante() => _nombreRestaurante != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "Precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "Imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _nombreRestaurante = snapshotData['Nombre_Restaurante'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _categoria = snapshotData['Categoria'] as String?;
    _precio = castToType<double>(snapshotData['Precio']);
    _imagen = snapshotData['Imagen'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plato_comida');

  static Stream<PlatoComidaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlatoComidaRecord.fromSnapshot(s));

  static Future<PlatoComidaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlatoComidaRecord.fromSnapshot(s));

  static PlatoComidaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlatoComidaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlatoComidaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlatoComidaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlatoComidaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlatoComidaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlatoComidaRecordData({
  String? nombre,
  String? nombreRestaurante,
  String? descripcion,
  String? categoria,
  double? precio,
  String? imagen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Nombre_Restaurante': nombreRestaurante,
      'Descripcion': descripcion,
      'Categoria': categoria,
      'Precio': precio,
      'Imagen': imagen,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlatoComidaRecordDocumentEquality implements Equality<PlatoComidaRecord> {
  const PlatoComidaRecordDocumentEquality();

  @override
  bool equals(PlatoComidaRecord? e1, PlatoComidaRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.nombreRestaurante == e2?.nombreRestaurante &&
        e1?.descripcion == e2?.descripcion &&
        e1?.categoria == e2?.categoria &&
        e1?.precio == e2?.precio &&
        e1?.imagen == e2?.imagen;
  }

  @override
  int hash(PlatoComidaRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.nombreRestaurante,
        e?.descripcion,
        e?.categoria,
        e?.precio,
        e?.imagen
      ]);

  @override
  bool isValidKey(Object? o) => o is PlatoComidaRecord;
}
