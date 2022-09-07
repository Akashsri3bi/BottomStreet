import 'package:bottomstreet/api_call.dart';
import 'package:bottomstreet/data.dart';
import 'package:bottomstreet/performance_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ApiData apiData;
  bool loading = true;
  @override
  void initState() {
    getLevel();
  }

  Future<ApiData> getLevel() async {
    apiData = await ApiCall.getResponse();
    setState(() {
      loading = false;
    });
    return apiData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Overview',
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Color.fromARGB(255, 1, 50, 90)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 2,
                    ),

                    // I Could have done this part using listview or listview builder but
                    // It was not very clear and items looked varied so I took little
                    // Long approach
                    // And also didn't got used of view more was it the UI so left a little that

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sector',
                          style:
                              TextStyle(color: Color.fromARGB(255, 1, 50, 90)),
                        ),
                        Text("🏛" + apiData.Sector)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Market Cap',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text(apiData.MCAP.toString())
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('EVDateEnd',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        apiData.EVDateEnd != "null"
                            ? Text(apiData.EVDateEnd)
                            : Text("-")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('EV',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        apiData.EV != "null" ? Text(apiData.EV) : Text("-")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Industry',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text("🏛" + apiData.Industry)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('IndustrySlug',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text(apiData.IndustrySlug)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Sector',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text(apiData.Sector)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Security',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text(apiData.Security)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('SecuritySlug',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text(apiData.SecuritySlug)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('YearEnd',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text(apiData.YearEnd)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('BookNavPerShare',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text(apiData.BookNavPerShare.toString())
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('TTMYearEnd',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text(apiData.TTMYearEnd.toString())
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Yield',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 50, 90))),
                        Text(apiData.Yield.toString())
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PerformanceScreen()),
                            );
                          },
                          child: const Text('Performance Screen')),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
