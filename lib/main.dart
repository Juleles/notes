import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_example/app/controllers/auth_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';

void main() async {
  Supabase supaProvider = await Supabase.initialize(
    url: 'https://dknbzzkpcqqgcadmjqmz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRrbmJ6emtwY3FxZ2NhZG1qcW16Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDIzMDg3OTUsImV4cCI6MjAxNzg4NDc5NX0.homDZIhzXl1QinkNhFO61rzfWaQ415F-ZAM6_GmsKDc',
  );

  final authC = Get.put(AuthController(), permanent: true);
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: supaProvider.client.auth.currentUser == null
          ? Routes.LOGIN
          : Routes.HOME,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
