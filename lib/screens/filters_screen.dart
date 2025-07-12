import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;

  @override
  initState() {
    _Summer = widget.currentFilters['summer']!;
    _Winter = widget.currentFilters['winter']!;
    _Family = widget.currentFilters['family']!;
    super.initState();
  }

  SwitchListTile buildSwithListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('الفلترة')),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _Summer,
                'winter': _Winter,
                'family': _Family,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                buildSwithListTile(
                  'الرحلات الصيفية',
                  'إظهار الرحلات في فصل الصيف فقط',
                  _Summer,
                  (newValue) {
                    setState(() {
                      _Summer = newValue;
                    });
                  },
                ),
                buildSwithListTile(
                  'الرحلات الشتوية',
                  'إظهار الرحلات في فصل الشتاء فقط',
                  _Winter,
                  (newValue) {
                    setState(() {
                      _Winter = newValue;
                    });
                  },
                ),
                buildSwithListTile(
                  'للعائلات فقط',
                  'إظهار الرحلات التي تناسب العائلات فقط',
                  _Family,
                  (newValue) {
                    setState(() {
                      _Family = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
