import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/github_controller.dart';
import '../RepoDetailsView/repo_details_view.dart';

class HomeView extends StatelessWidget {
  final String username;

  HomeView({super.key, required this.username});

  final controller = Get.put(GithubController());

  final RxBool isGrid = false.obs;
  final RxString filter = 'name'.obs;

  @override
  Widget build(BuildContext context) {
    controller.fetchUserData(username);
    controller.fetchRepos(username);
    final theme = context.theme;

    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub: @$username"),
        actions: [
          IconButton(
            icon: Obx(() => Icon(isGrid.value ? Icons.list : Icons.grid_view)),
            onPressed: () => isGrid.toggle(),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              filter.value = value;
              controller.sortRepos(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'name', child: Text("Sort by Name")),
              const PopupMenuItem(value: 'star', child: Text("Sort by Stars")),
              const PopupMenuItem(value: 'date', child: Text("Sort by Date")),
            ],
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        if (controller.user.value == null) {
          return const Center(child: Text("User not found"));
        }

        final user = controller.user.value!;
        final repos = controller.repos;

        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchUserData(username);
            await controller.fetchRepos(username);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatarUrl ?? ''),
                    radius: 30,
                  ),
                  title: Text(
                    user.name ?? username,
                    style: theme.textTheme.titleMedium,
                  ),
                  subtitle: Text(user.bio ?? 'No bio available'),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Repository List",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Obx(
                  () => isGrid.value
                      ? GridView.builder(
                          padding: const EdgeInsets.all(8),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: repos.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.3,
                              ),
                          itemBuilder: (context, index) {
                            final repo = repos[index];
                            return GestureDetector(
                              onTap: () =>
                                  Get.to(() => RepoDetailsView(repo: repo)),
                              child: Card(
                                margin: EdgeInsets.only(right: 8, top: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        repo.name ?? '',
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(repo.language ?? 'Unknown'),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Text(' ${repo.stargazersCount}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: repos.length,
                          itemBuilder: (context, index) {
                            final repo = repos[index];
                            return ListTile(
                              title: Text(repo.name ?? ''),
                              subtitle: Text(
                                repo.description ?? 'No description',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  Text(' ${repo.stargazersCount}'),
                                ],
                              ),
                              onTap: () =>
                                  Get.to(() => RepoDetailsView(repo: repo)),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
