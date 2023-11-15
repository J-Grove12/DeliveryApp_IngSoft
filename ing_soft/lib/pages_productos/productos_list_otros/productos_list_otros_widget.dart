import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'productos_list_otros_model.dart';
export 'productos_list_otros_model.dart';

class ProductosListOtrosWidget extends StatefulWidget {
  const ProductosListOtrosWidget({Key? key}) : super(key: key);

  @override
  _ProductosListOtrosWidgetState createState() =>
      _ProductosListOtrosWidgetState();
}

class _ProductosListOtrosWidgetState extends State<ProductosListOtrosWidget> {
  late ProductosListOtrosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductosListOtrosModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<CarritoRecord>>(
      stream: queryCarritoRecord(
        queryBuilder: (carritoRecord) => carritoRecord
            .where(
              'creador',
              isEqualTo: currentUserReference,
            )
            .where(
              'Activo',
              isEqualTo: true,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CarritoRecord> productosListOtrosCarritoRecordList =
            snapshot.data!;
        final productosListOtrosCarritoRecord =
            productosListOtrosCarritoRecordList.isNotEmpty
                ? productosListOtrosCarritoRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('MenuPrincipal');
                  },
                ),
              ),
              title: Text(
                'Ordena Ahora',
                style: FlutterFlowTheme.of(context).displaySmall,
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 44.0,
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('Carrito');
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Productos disponibles',
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: StreamBuilder<List<PlatoComidaRecord>>(
                      stream: queryPlatoComidaRecord(
                        queryBuilder: (platoComidaRecord) =>
                            platoComidaRecord.where(
                          'Categoria',
                          isEqualTo: 'Otros',
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<PlatoComidaRecord> listViewPlatoComidaRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewPlatoComidaRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewPlatoComidaRecord =
                                listViewPlatoComidaRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x411D2429),
                                      offset: Offset(0.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 1.0, 1.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          child: Image.network(
                                            listViewPlatoComidaRecord.imagen,
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 4.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewPlatoComidaRecord
                                                    .nombre,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 8.0, 0.0),
                                                child: AutoSizeText(
                                                  listViewPlatoComidaRecord
                                                      .descripcion
                                                      .maybeHandleOverflow(
                                                    maxChars: 70,
                                                    replacement: '…',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (productosListOtrosCarritoRecord !=
                                                    null) {
                                                  var comidaSeleccionadaRecordReference1 =
                                                      ComidaSeleccionadaRecord
                                                          .collection
                                                          .doc();
                                                  await comidaSeleccionadaRecordReference1
                                                      .set(
                                                          createComidaSeleccionadaRecordData(
                                                    nombreComidasSeleccionada:
                                                        listViewPlatoComidaRecord
                                                            .nombre,
                                                    comida:
                                                        listViewPlatoComidaRecord
                                                            .reference,
                                                    categoria:
                                                        listViewPlatoComidaRecord
                                                            .categoria,
                                                    precio:
                                                        listViewPlatoComidaRecord
                                                            .precio,
                                                    imagen:
                                                        listViewPlatoComidaRecord
                                                            .imagen,
                                                    creador:
                                                        currentUserReference,
                                                    descripcion:
                                                        listViewPlatoComidaRecord
                                                            .descripcion,
                                                  ));
                                                  _model.productoCreadoExiste =
                                                      ComidaSeleccionadaRecord
                                                          .getDocumentFromData(
                                                              createComidaSeleccionadaRecordData(
                                                                nombreComidasSeleccionada:
                                                                    listViewPlatoComidaRecord
                                                                        .nombre,
                                                                comida:
                                                                    listViewPlatoComidaRecord
                                                                        .reference,
                                                                categoria:
                                                                    listViewPlatoComidaRecord
                                                                        .categoria,
                                                                precio:
                                                                    listViewPlatoComidaRecord
                                                                        .precio,
                                                                imagen:
                                                                    listViewPlatoComidaRecord
                                                                        .imagen,
                                                                creador:
                                                                    currentUserReference,
                                                                descripcion:
                                                                    listViewPlatoComidaRecord
                                                                        .descripcion,
                                                              ),
                                                              comidaSeleccionadaRecordReference1);

                                                  await productosListOtrosCarritoRecord!
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'Valor': FieldValue
                                                            .increment(_model
                                                                .productoCreadoExiste!
                                                                .precio),
                                                        'ComidasSeleccionada':
                                                            FieldValue
                                                                .arrayUnion([
                                                          _model
                                                              .productoCreadoExiste
                                                              ?.reference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                } else {
                                                  var comidaSeleccionadaRecordReference2 =
                                                      ComidaSeleccionadaRecord
                                                          .collection
                                                          .doc();
                                                  await comidaSeleccionadaRecordReference2
                                                      .set(
                                                          createComidaSeleccionadaRecordData(
                                                    nombreComidasSeleccionada:
                                                        listViewPlatoComidaRecord
                                                            .nombre,
                                                    comida:
                                                        listViewPlatoComidaRecord
                                                            .reference,
                                                    descripcion:
                                                        listViewPlatoComidaRecord
                                                            .descripcion,
                                                    categoria:
                                                        listViewPlatoComidaRecord
                                                            .categoria,
                                                    precio:
                                                        listViewPlatoComidaRecord
                                                            .precio,
                                                    imagen:
                                                        listViewPlatoComidaRecord
                                                            .imagen,
                                                    creador:
                                                        currentUserReference,
                                                  ));
                                                  _model.productoCreado =
                                                      ComidaSeleccionadaRecord
                                                          .getDocumentFromData(
                                                              createComidaSeleccionadaRecordData(
                                                                nombreComidasSeleccionada:
                                                                    listViewPlatoComidaRecord
                                                                        .nombre,
                                                                comida:
                                                                    listViewPlatoComidaRecord
                                                                        .reference,
                                                                descripcion:
                                                                    listViewPlatoComidaRecord
                                                                        .descripcion,
                                                                categoria:
                                                                    listViewPlatoComidaRecord
                                                                        .categoria,
                                                                precio:
                                                                    listViewPlatoComidaRecord
                                                                        .precio,
                                                                imagen:
                                                                    listViewPlatoComidaRecord
                                                                        .imagen,
                                                                creador:
                                                                    currentUserReference,
                                                              ),
                                                              comidaSeleccionadaRecordReference2);

                                                  await CarritoRecord.collection
                                                      .doc()
                                                      .set({
                                                    ...createCarritoRecordData(
                                                      creador:
                                                          currentUserReference,
                                                      activo: true,
                                                      valor: _model
                                                          .productoCreado
                                                          ?.precio,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'ComidasSeleccionada': [
                                                          _model.productoCreado
                                                              ?.reference
                                                        ],
                                                      },
                                                    ),
                                                  });
                                                }

                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.add_circle,
                                                color: Colors.green,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 4.0, 8.0),
                                            child: Text(
                                              formatNumber(
                                                listViewPlatoComidaRecord
                                                    .precio,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                                currency: '\$',
                                              ),
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
