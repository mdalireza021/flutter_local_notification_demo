import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notification_demo/theme_mode_controller.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeModeController themeModeController = Get.put<ThemeModeController>(ThemeModeController());
    return Obx(()=>
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notification',
        theme: ThemeData.light(useMaterial3: false),
        darkTheme: ThemeData.dark(useMaterial3: false),

        themeMode: themeModeController.rxIsDarkMode.value ? ThemeMode.light : ThemeMode.dark,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final ThemeModeController _controller = Get.find<ThemeModeController>();

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notification Demo'),
      ),
      body: Obx(()=> Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CupertinoSwitch(
              activeColor: Colors.grey,
              thumbColor:  _controller.rxIsDarkMode.value ? Colors.white : Colors.black,
              trackColor: Colors.black12,
              value: !_controller.rxIsDarkMode.value,
              onChanged: (value) => _controller.toggleThemeMode()),
            ),
        ],
      ),),
    );
  }
}
