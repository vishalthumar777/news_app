import 'package:flutter/material.dart';
import 'package:machers_assignment/utils/app_text_styles.dart';
import 'package:machers_assignment/view_models/auth_view_model.dart';
import 'package:machers_assignment/view_models/news_view_model.dart';
import 'package:machers_assignment/views/news_list_item.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsViewModel>(context, listen: false)
          .fetchNews('health', 'in');
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: authViewModel.signOut,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: newsViewModel.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: newsViewModel.articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: NewsListItem(article: newsViewModel.articles[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => newsViewModel.fetchNews('health', 'in'),
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
