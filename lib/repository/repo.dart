import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/postsmodel.dart';
import "package:http/http.dart";

// This a repository file where we fetch the data from our Api
class PostRepository {
  String userUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Posts>> getPosts() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => Posts.fromJson(e)).toList();
    } else {
      throw ErrorDescription(
          "Could Not Fetch Data From Server Please Try Again");
    }
  }
}
