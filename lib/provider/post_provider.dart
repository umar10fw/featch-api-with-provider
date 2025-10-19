import 'package:flutter/material.dart';
import '../model/post_model.dart';
import '../services/api_service.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];
  bool _isLoading = false;
  String? _error;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final ApiService _apiService = ApiService();

  Future<void> fetchPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _posts = await _apiService.fetchPosts();
    } catch (e) {
      _error = 'Error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
