import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:hazeupp/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:hazeupp/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            THeaderPrimaryContainer(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
