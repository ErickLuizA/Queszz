import 'package:Queszz/ui/shared/load_error_widget.dart';
import 'package:Queszz/ui/shared/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:Queszz/presentation/viewmodels/home_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'components/category_list_widget.dart';
import 'components/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<HomeViewModel>(context, listen: false).loadCategories(
      Locale("${AppLocalizations.of(context).localeName}", ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
        title: Text("Queszz"),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).letsPlay,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).chooseCategory,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 20),
              if (viewModel.uiState == UIState.Loading) LoadingWidget(),
              if (viewModel.uiState == UIState.Error)
                LoadErrorWidget(
                  text: AppLocalizations.of(context).errorCategories,
                  retry: () {
                    viewModel.loadCategories(
                      Locale("${AppLocalizations.of(context).localeName}", ""),
                    );
                  },
                ),
              if (viewModel.uiState == UIState.Success)
                CategoryListWidget(
                  categoryList: viewModel.categoryList,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
