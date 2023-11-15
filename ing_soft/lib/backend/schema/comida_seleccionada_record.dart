import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComidaSeleccionadaRecord extends FirestoreRecord {
  ComidaSeleccionadaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre_comidasSeleccionada" field.
  String? _nombreComidasSeleccionada;
  String get nombreComidasSeleccionada => _nombreComidasSeleccionada ?? '';
  bool hasNombreComidasSeleccionada() => _nombreComidasSeleccionada != null;

  // "comida" field.
  DocumentReference? _comida;
  DocumentReference? get comida => _comida;
  bool hasComida() => _comida != null;

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

  // "creador" field.
  DocumentReference? _creador;
  DocumentReference? get creador => _creador;
  bool hasCreador() => _creador != null;

  // "carrito" field.
  DocumentReference? _carrito;
  DocumentReference? get carrito => _carrito;
  bool hasCarrito() => _carrito != null;

  void _initializeFields() {
    _nombreComidasSeleccionada =
        snapshotData['Nombre_comidasSeleccionada'] as String?;
    _comida = snapshotData['comida'] as DocumentReference?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _categoria = snapshotData['Categoria'] as String?;
    _precio = castToType<double>(snapshotData['Precio']);
    _imagen = snapshotData['Imagen'] as String?;
    _creador = snapshotData['creador'] as DocumentReference?;
    _carrito = snapshotData['carrito'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ComidaSeleccionada');

  static Stream<ComidaSeleccionadaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComidaSeleccionadaRecord.fromSnapshot(s));

  static Future<ComidaSeleccionadaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ComidaSeleccionadaRecord.fromSnapshot(s));

  static ComidaSeleccionadaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ComidaSeleccionadaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComidaSeleccionadaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComidaSeleccionadaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComidaSeleccionadaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComidaSeleccionadaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComidaSeleccionadaRecordData({
  String? nombreComidasSeleccionada,
  DocumentReference? comida,
  String? descripcion,
  String? categoria,
  double? precio,
  String? imagen,
  DocumentReference? creador,
  DocumentReference? carrito,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre_comidasSeleccionada': nombreComidasSeleccionada,
      'comida': comida,
      'Descripcion': descripcion,
      'Categoria': categoria,
      'Precio': precio,
      'Imagen': imagen,
      'creador': creador,
      'carrito': carrito,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComidaSeleccionadaRecordDocumentEquality
    implements Equality<ComidaSeleccionadaRecord> {
  const ComidaSeleccionadaRecordDocumentEquality();

  @override
  bool equals(ComidaSeleccionadaRecord? e1, ComidaSeleccionadaRecord? e2) {
    return e1?.nombreComidasSeleccionada == e2?.nombreComidasSeleccionada &&
        e1?.comida == e2?.comida &&
        e1?.descripcion == e2?.descripcion &&
        e1?.categoria == e2?.categoria &&
        e1?.precio == e2?.precio &&
        e1?.imagen == e2?.imagen &&
        e1?.creador == e2?.creador &&
        e1?.carrito == e2?.carrito;
  }

  @override
  int hash(ComidaSeleccionadaRecord? e) => const ListEquality().hash([
        e?.nombreComidasSeleccionada,
        e?.comida,
        e?.descripcion,
        e?.categoria,
        e?.precio,
        e?.imagen,
        e?.creador,
        e?.carrito
      ]);

  @override
  bool isValidKey(Object? o) => o is ComidaSeleccionadaRecord;
}
