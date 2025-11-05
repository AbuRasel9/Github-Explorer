import 'package:github_explorer/models/repo_model.dart';
import 'package:github_explorer/models/user_model.dart';

abstract class GithubExplorerRepo{
  Future<UserModel>fetchUser(String userName);
  Future<List<RepoModel>>fetchRepos(String userName);

}