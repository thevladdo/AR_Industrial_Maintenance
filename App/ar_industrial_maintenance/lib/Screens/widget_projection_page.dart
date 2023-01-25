// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, depend_on_referenced_packages
import 'dart:math';
import 'dart:math' as math;
import 'package:ar_industrial_maintenance/Model/data_model.dart';
import 'package:ar_industrial_maintenance/Widgets/ar_widget.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../Widgets/footer_scan.dart';
import '../Widgets/title.dart';

class WidgetProjectionPage extends StatefulWidget {
  const WidgetProjectionPage({super.key, required this.data});
  final List<DataModel> data;

  @override
  _WidgetProjectionPageState createState() => _WidgetProjectionPageState();
}

class _WidgetProjectionPageState extends State<WidgetProjectionPage> {
  late ARKitController arkitController;
  String anchorId = '';
  double x = 0, y = 0;
  double width = 1, height = 1;
  Matrix4 transform = Matrix4.identity();
  var random = Random();

  List<Widget> widgets = List.empty(growable: true);

  @override
  void dispose() {
    arkitController.onAddNodeForAnchor = null;
    arkitController.onUpdateNodeForAnchor = null;
    arkitController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    widgets.add(ARKitSceneView(
      trackingImagesGroupName: 'AR Resources',
      onARKitViewCreated: onARKitViewCreated,
      worldAlignment: ARWorldAlignment.camera,
      configuration: ARKitConfiguration.imageTracking,
    ));
    super.initState();
  }

  void updateDataWidgets() {
    widgets.clear();
    widgets.add(ARKitSceneView(
      trackingImagesGroupName: 'AR Resources',
      onARKitViewCreated: onARKitViewCreated,
      worldAlignment: ARWorldAlignment.camera,
      configuration: ARKitConfiguration.imageTracking,
    ));
    for (DataModel d in widget.data) {
      widgets.add(
        Positioned(
          left: x + d.getCoordinateX,
          top: y + d.getCoordinateY,
          child: Container(
              transform: transform,
              width: width,
              height: height,
              child: ArWidget(
                name: d.getName,
                value: d.getValue.toString(),
                unit: d.getUnit,
                alerts: true,
              )),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const AppTitle(),
        ),
        body: Stack(
          children: widgets,
        ),
        bottomNavigationBar: const FooterScan(),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = _handleAddAnchor;
    this.arkitController.onUpdateNodeForAnchor = _handleUpdateAnchor;
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitImageAnchor) {
      anchorId = anchor.identifier;

      _updatePosition(anchor);
      // _updateRotation(anchor);
    }
  }

  void _handleUpdateAnchor(ARKitAnchor anchor) {
    if (anchor.identifier == anchorId && anchor is ARKitImageAnchor) {
      _updatePosition(anchor);
      updateDataWidgets();
      // _updateRotation(anchor);
    }
  }

  Future _updateRotation(ARKitAnchor anchor) async {
    final t = anchor.transform.clone();
    t.invertRotation();
    t.rotateZ(math.pi / 2);
    t.rotateX(math.pi / 2);
    setState(() {
      transform = t;
    });
  }

  Future _updatePosition(ARKitImageAnchor anchor) async {
    final transform = anchor.transform;
    final width = anchor.referenceImagePhysicalSize.x / 2;
    final height = anchor.referenceImagePhysicalSize.y / 2;

    final topRight = vector.Vector4(width, 0, -height, 1)
      ..applyMatrix4(transform);
    final bottomRight = vector.Vector4(width, 0, height, 1)
      ..applyMatrix4(transform);
    final bottomLeft = vector.Vector4(-width, 0, -height, 1)
      ..applyMatrix4(transform);
    final topLeft = vector.Vector4(-width, 0, height, 1)
      ..applyMatrix4(transform);

    final pointsWorldSpace = [topRight, bottomRight, bottomLeft, topLeft];

    final pointsViewportSpace = pointsWorldSpace.map(
        (p) => arkitController.projectPoint(vector.Vector3(p.x, p.y, p.z)));
    final pointsViewportSpaceResults = await Future.wait(pointsViewportSpace);

    setState(() {
      x = pointsViewportSpaceResults[2]!.x;
      y = pointsViewportSpaceResults[2]!.y;
      this.width = pointsViewportSpaceResults[0]!
          .distanceTo(pointsViewportSpaceResults[3]!);
      this.height = pointsViewportSpaceResults[1]!
          .distanceTo(pointsViewportSpaceResults[2]!);
    });
  }
}
