import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'attractions_detail_screen.dart';

class AttractionsScreen extends StatefulWidget {
  const AttractionsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AttractionsScreenState();
  }
}

class _AttractionsScreenState extends State<AttractionsScreen> {
  List<dynamic> _attraction = [];
  @override
  void initState() {
    super.initState();
    _fetchAttractions();
  }

  Future<void> _fetchAttractions() async {
    final response = await http.get(Uri.parse('api here'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      setState(() {
        _attraction = jsonResponse['data'];
      });
    } else {
      throw Exception('Failed to load attractions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attraction")),
      body: ListView.builder(
        itemCount: _attraction.length,
        itemBuilder: (context, index) {
          final attraction = _attraction[index];
          return ListTile(
            leading: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Image.network(attraction['coverimage']),
            ),
            title: Row(children: [Text(attraction['name'])]),
            subtitle: Text(
              attraction['detail'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AttractionsDetailScreen(id: attraction['id']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
