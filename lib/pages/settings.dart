import 'package:contacts/consts/shearedPreferencesData.dart';
import 'package:contacts/pages/homepage.dart';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //BackGroundColors
  int selectedBackgroundColor = Colors.white.value;
  // Themes Colors
  int selectedThemesColor = Colors.indigo.value;

// Save Data in Sheared Preferencese
  Future saveColors() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(BACKGROUNDColor, selectedBackgroundColor);
    sharedPreferences.setInt(THEMColors, selectedThemesColor);
  }
// Get Data From Sheared Preferencese

  Future getColors() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      selectedBackgroundColor =
          sharedPreferences.getInt(BACKGROUNDColor) ?? Colors.white.value;
      selectedThemesColor =
          sharedPreferences.getInt(THEMColors) ?? Colors.indigo.value;
    });
  }

  @override
  void initState() {
    getColors();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(selectedBackgroundColor),
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
        backgroundColor: Color(selectedThemesColor),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BackGroundColors
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber),
              ),
              child: Column(
                children: [
                  const Text(
                    'Background Colors',
                    textAlign: TextAlign.center,
                  ),
                  RadioListTile(
                    title: Text('Red'),
                    value: Colors.red.value,
                    groupValue: selectedBackgroundColor,
                    onChanged: (int? value) {
                      setState(() {
                        selectedBackgroundColor = value!;
                      });
                      saveColors();
                    },
                  ),
                  RadioListTile(
                    title: Text('White'),
                    value: Colors.white.value,
                    groupValue: selectedBackgroundColor,
                    onChanged: (int? value) {
                      setState(() {
                        selectedBackgroundColor = value!;
                      });
                      saveColors();
                    },
                  ),
                  RadioListTile(
                    title: Text('Indigo'),
                    value: Colors.indigo.value,
                    groupValue: selectedBackgroundColor,
                    onChanged: (int? value) {
                      setState(() {
                        selectedBackgroundColor = value!;
                      });
                      saveColors();
                    },
                  ),
                ],
              ),
            ), // Themes Colors
            SizedBox(height: 20),
            // ThemeColors
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber),
              ),
              child: Column(
                children: [
                  const Text(
                    'Themes Color',
                    textAlign: TextAlign.center,
                  ),
                  RadioListTile(
                    title: Text('Red'),
                    value: Colors.red.value,
                    groupValue: selectedThemesColor,
                    onChanged: (int? value) {
                      setState(() {
                        selectedThemesColor = value!;
                      });
                      saveColors();
                    },
                  ),
                  RadioListTile(
                    title: Text('Black'),
                    value: Colors.black.value,
                    groupValue: selectedThemesColor,
                    onChanged: (int? value) {
                      setState(() {
                        selectedThemesColor = value!;
                      });
                      saveColors();
                    },
                  ),
                  RadioListTile(
                    title: Text('Indigo'),
                    value: Colors.indigo.value,
                    groupValue: selectedThemesColor,
                    onChanged: (int? value) {
                      setState(() {
                        selectedThemesColor = value!;
                      });
                      saveColors();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
