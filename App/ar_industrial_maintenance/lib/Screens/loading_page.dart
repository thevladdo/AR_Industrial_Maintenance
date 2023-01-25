import 'dart:async';

import 'package:animated_button/animated_button.dart';
import 'package:ar_industrial_maintenance/Model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ApiController/data_apicontroller.dart';
import '../Widgets/title.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key, required this.zoneId});

  final String? zoneId;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  List<DataModel> data = List.empty(growable: true);
  bool error = false;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    if (widget.zoneId != null) {
      data = await DataApiController().getDataByZone(widget.zoneId!);
    }

    if (data.isNotEmpty) {
      Timer(const Duration(seconds: 1), () {
        context.go('/arpage', extra: data);
      });
    }
    if (data.isEmpty) {
      Timer(const Duration(seconds: 1), () {
        error = true;
      });

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
          child: error
              ? AnimatedButton(
                  color: Colors.white,
                  height: 60,
                  width: 120,
                  onPressed: () {
                    context.go('/scanqr');
                  },
                  child: const Text(
                    'Try Again',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      shadows: <Shadow>[
                        Shadow(
                            color: Color.fromARGB(255, 178, 185, 208),
                            offset: Offset.zero,
                            blurRadius: 20)
                      ],
                    ),
                  ),
                )
              : const CircularProgressIndicator()),
    );
  }
}
