import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('مشاريعي')),
    body: const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Icon(Icons.folder_open_outlined, size: 56, color: Colors.grey),
      SizedBox(height: 12),
      Text('لا توجد مشاريع محفوظة حتى الآن'),
      SizedBox(height: 6),
      Text('ستظهر هنا التصاميم بعد تفعيل الحفظ المحلي.', style: TextStyle(color: Colors.grey, fontSize: 12)),
    ])),
  );
}
