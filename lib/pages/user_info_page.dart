import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'registration_page.dart';

// SRSP5: страница показывает данные, сохранённые RegistrationPage
// через SharedPreferences.
class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  // чёрно-белая тема под мангу
  static const _blue = Colors.black;

  bool _loading = true;
  String _name = '';
  String _phone = '';
  String _email = '';
  String _story = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('full_name') ?? '';
      _phone = prefs.getString('phone_number') ?? '';
      _email = prefs.getString('email') ?? '';
      _story = prefs.getString('life_story') ?? '';
      _loading = false;
    });
  }

  Future<void> _clearAndGoBack() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('full_name');
    await prefs.remove('phone_number');
    await prefs.remove('email');
    await prefs.remove('life_story');
    if (!mounted) return;
    // данных больше нет — отправляем обратно на форму регистрации,
    // убирая весь предыдущий стек экранов
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const RegistrationPage()),
      (route) => false,
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: _blue),
      title: Text(
        label,
        style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
      ),
      subtitle: Text(
        value.isEmpty ? '-' : value,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: _blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'User Info',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundColor: _blue,
                    child: Text(
                      _name.isNotEmpty ? _name[0].toUpperCase() : '?',
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      _infoTile(Icons.person_outline, 'Full Name', _name),
                      const Divider(height: 1),
                      _infoTile(Icons.phone_outlined, 'Phone Number', _phone),
                      const Divider(height: 1),
                      _infoTile(Icons.mail_outline, 'Email Address', _email),
                      const Divider(height: 1),
                      _infoTile(Icons.menu_book_outlined, 'Life Story', _story),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  height: 44.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _clearAndGoBack,
                    child: const Text('Clear Data & Log Out'),
                  ),
                ),
              ],
            ),
    );
  }
}
