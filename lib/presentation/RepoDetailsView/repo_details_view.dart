import 'package:flutter/material.dart';
import 'package:github_explorer/models/repo_model.dart';

class RepoDetailsView extends StatelessWidget {
  final RepoModel repo;
  const RepoDetailsView({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repo.name ?? 'Repository Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(repo.name ?? '',
                style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(repo.description ?? 'No description available'),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text(' ${repo.stargazersCount} Stars'),
              ],
            ),
            const SizedBox(height: 10),
            Text('Language: ${repo.language ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Created at: ${repo.createdAt ?? ''}'),
          ],
        ),
      ),
    );
  }
}
