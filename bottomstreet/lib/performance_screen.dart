import 'package:bottomstreet/api_call.dart';
import 'package:bottomstreet/data.dart';
import 'package:bottomstreet/performance_widget.dart';
import 'package:bottomstreet/performanceitem.dart';
import 'package:flutter/material.dart';

class PerformanceScreen extends StatefulWidget {
  @override
  State<PerformanceScreen> createState() => _PerformanceState();
}

class _PerformanceState extends State<PerformanceScreen> {
  late List<PerformanceItem> items;
  bool loading = true;
  @override
  void initState() {
    getListResponse();
  }

  Future<List<PerformanceItem>> getListResponse() async {
    items = await ApiCall.getList();
    setState(() {
      loading = false;
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: items.length,
                  itemBuilder: ((context, index) {
                    return PerformanceWidget(
                      item: items[index],
                    );
                  })),
            ),
    );
  }
}
