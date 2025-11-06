import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_explorer/data/network/base_api_services.dart';
import 'package:github_explorer/data/network/network_api_services.dart';
import 'package:github_explorer/models/repo_model.dart';
import 'package:github_explorer/models/user_model.dart';
import 'package:github_explorer/repositories/github_explorer_repo/github_explorer_repo.dart';

class GithubExplorerRepoImpl implements GithubExplorerRepo{
  final BaseApiServices _apiService = NetworkApiService();

  /// Fetch GitHub repositories of a user
  @override
  Future<List<RepoModel>> fetchRepos(String userName) async {
    try {
      final response = await _apiService.getApi("$userName/repos");
      if (response is List) {
        return response.map((e) => RepoModel.fromJson(e)).toList();
      } else {
        throw Exception("Invalid repository data format");
      }
    } catch (e) {
      rethrow;
    }
  }


  /// Fetch GitHub user info
  @override
  Future<UserModel> fetchUser(String userName) async {
    try {
      final response = await _apiService.getApi(userName);
      return UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}