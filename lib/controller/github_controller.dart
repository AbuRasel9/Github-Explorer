import 'package:get/get.dart';
import 'package:github_explorer/models/user_model.dart';
import 'package:github_explorer/models/repo_model.dart';
import 'package:github_explorer/repositories/github_explorer_repo/github_explorer_repo_impl.dart';

class GithubController extends GetxController {
  final _repo = GithubExplorerRepoImpl();

  var user = Rxn<UserModel>();
  var repos = <RepoModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  /// Fetch user data
  Future<void> fetchUserData(String username) async {
    try {
      isLoading(true);
      errorMessage('');
      final result = await _repo.fetchUser(username);
      user.value = result;
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  /// Fetch repos
  Future<void> fetchRepos(String username) async {
    try {
      isLoading(true);
      errorMessage('');
      final result = await _repo.fetchRepos(username);
      repos.assignAll(result);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
