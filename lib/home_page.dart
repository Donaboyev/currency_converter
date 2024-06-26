import 'currency.dart';
import 'main_drawer.dart';
import 'app_helpers.dart';
import 'http_service.dart';
import 'app_provider.dart';
import 'currency_item.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  List<Currency> _currencies = [];
  late RefreshController _controller;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _controller = RefreshController();
    _selectedDate = DateTime.now();
    _getCurrencies();
  }

  Future<void> _getCurrencies() async {
    setState(() {
      _isLoading = true;
      _currencies = [];
    });
    final client = GetIt.I.get<HttpService>().client();
    final response = await client.get(
        '/uz/arkhiv-kursov-valyut/json/all/${AppHelpers.getFormattedDate(_selectedDate)}/');
    setState(() {
      _isLoading = false;
      _currencies = CurrencyResponse.fromJson(response.data).data ?? [];
    });
  }

  Future<void> _refreshCurrencies() async {
    final client = GetIt.I.get<HttpService>().client();
    final response = await client.get(
        '/uz/arkhiv-kursov-valyut/json/all/${AppHelpers.getFormattedDate(_selectedDate)}/');
    setState(() {
      _currencies = CurrencyResponse.fromJson(response.data).data ?? [];
    });
    _controller.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text(
          '${translate?.currencyConverter}',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF01CEDB),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              final DateTime? changedDate = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: (DateTime.now().subtract(const Duration(days: 30))),
                lastDate: DateTime.now(),
              );
              if (changedDate != null) {
                setState(() {
                  _selectedDate = changedDate;
                  _getCurrencies();
                });
              }
            },
            icon: const Icon(Icons.calendar_month),
          ),
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'uz',
                child: Text('O\'zbekcha'),
              ),
              const PopupMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: 'ru',
                child: Text('Русский'),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'uz':
                  provider.setLocale('uz', '');
                  break;
                case 'ru':
                  provider.setLocale('ru', '');
                  break;
                default:
                  provider.setLocale('en', '');
                  break;
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00D0CE),
              Color(0xFF82E5BA),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SmartRefresher(
                controller: _controller,
                onRefresh: _refreshCurrencies,
                child: ListView.builder(
                  itemCount: _currencies.length,
                  itemBuilder: (context, index) {
                    return CurrencyItem(
                      currency: _currencies[index],
                      locale: provider.locale?.languageCode ?? 'en',
                      selectedDate: _selectedDate,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
