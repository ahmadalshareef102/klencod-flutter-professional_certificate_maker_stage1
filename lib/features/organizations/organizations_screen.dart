import 'package:flutter/material.dart';

class OrganizationsScreen extends StatelessWidget {
  const OrganizationsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('المؤسسات')),
    body: const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Icon(Icons.business_outlined, size: 56, color: Colors.grey),
      SizedBox(height: 12),
      Text('إدارة المؤسسات'),
      SizedBox(height: 6),
      Text('سيتم تفعيل إضافة المؤسسات والشعارات في مرحلة الإدارة.', style: TextStyle(color: Colors.grey, fontSize: 12)),
    ])),
  );
}
