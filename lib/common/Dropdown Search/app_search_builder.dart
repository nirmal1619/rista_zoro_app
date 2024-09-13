import 'package:flutter/material.dart';

class AppSearchBuilder {
  static Future<String?> showSearchWidget(
      BuildContext context, List<String> dataList) {
    return showSearch<String>(
      context: context,
      delegate: _AppSearchDelegate(dataList: dataList),
    );
  }
}

class _AppSearchDelegate extends SearchDelegate<String> {
  final List<String> dataList;

  _AppSearchDelegate({required this.dataList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = dataList
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          surfaceTintColor: Colors.lightBlueAccent,
          child: ListTile(
            title: Text(results[index]),
            onTap: () {
              close(context, results[index]);
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = dataList
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          surfaceTintColor: Colors.lightBlueAccent,
          // color: AppColors.grey.withOpacity(0.1),
          child: ListTile(
            title: Text(suggestions[index]),
            onTap: () {
              query = suggestions[index];
              showResults(context);
            },
          ),
        );
      },
    );
  }
}
