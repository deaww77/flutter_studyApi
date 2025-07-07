import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AttractionsDetailScreen extends StatefulWidget {
  final int id;
  const AttractionsDetailScreen({super.key, required this.id});

  @override
  State<StatefulWidget> createState() {
    return _AttractionsDetailScreenState();
  }
}

class _AttractionsDetailScreenState extends State<AttractionsDetailScreen> {
  Map<String, dynamic>? _attractionDetail;

  @override
  void initState() {
    super.initState();
    _fetchAttractionsDetail();
  }

  Future<void> _fetchAttractionsDetail() async {
    final respone = await http.get(Uri.parse('api here${widget.id}'));
    setState(() {
      _attractionDetail = json.decode(respone.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('detail')),
      body: _attractionDetail == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(_attractionDetail!['attraction']['coverimage']),
                  const SizedBox(height: 16),
                  Text(
                    _attractionDetail!['attraction']['name'],

                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(_attractionDetail!['attraction']['detail']),
                ],
              ),
            ),
    );
  }
}
