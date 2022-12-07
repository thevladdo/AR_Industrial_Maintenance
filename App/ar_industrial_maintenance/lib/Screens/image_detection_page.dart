import 'dart:async';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../Widgets/footer_scan.dart';
import '../Widgets/title.dart';

class ImageDetectionPage extends StatefulWidget {
  const ImageDetectionPage({super.key});

  @override
  _ImageDetectionPageState createState() => _ImageDetectionPageState();
}

class _ImageDetectionPageState extends State<ImageDetectionPage> {
  late ARKitController arkitController;
  Timer? timer;
  bool anchorWasFound = false;

  @override
  void dispose() {
    timer?.cancel();
    arkitController.dispose();
    super.dispose();
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
        body: ARKitSceneView(
          detectionImagesGroupName: 'AR Resources',
          onARKitViewCreated: onARKitViewCreated,
        ),
        bottomNavigationBar: const FooterScan(),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = onAnchorWasFound;
  }

  void onAnchorWasFound(ARKitAnchor anchor) {
    if (anchor is ARKitImageAnchor) {
      setState(() => anchorWasFound = true);

      final material = ARKitMaterial(
        lightingModelName: ARKitLightingModel.lambert,
        // diffuse: ARKitMaterialProperty.image('images/earth.jpg'),
        diffuse: ARKitMaterialProperty.color(Colors.red),
      );
      final sphere = ARKitSphere(
        materials: [material],
        radius: 0.1,
      );

      final earthPosition = anchor.transform.getColumn(3);
      final node = ARKitNode(
        geometry: sphere,
        position:
            vector.Vector3(earthPosition.x, earthPosition.y, earthPosition.z),
        eulerAngles: vector.Vector3.zero(),
      );
      arkitController.add(node);

      timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
        final old = node.eulerAngles;
        final eulerAngles = vector.Vector3(old.x + 0.01, old.y, old.z);
        node.eulerAngles = eulerAngles;
      });
    }
  }
}
