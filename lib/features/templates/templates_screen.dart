import 'package:flutter/material.dart';
import '../../app/theme.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({super.key});

  static const categories = [
    'شكر وتقدير', 'مشاركة', 'إتمام دورة', 'تفوق وامتياز',
    'تكريم', 'خبرة', 'حضور', 'إنجاز',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('مكتبة القوالب')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('اختر نوع الشهادة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 14),
        ...categories.map((name) => Card(
          child: ListTile(
            leading: const CircleAvatar(backgroundColor: Color(0xFFF5EBD8), child: Icon(Icons.workspace_premium, color: AppTheme.navy)),
            title: Text(name),
            subtitle: const Text('ستضاف القوالب القابلة للتحرير ضمن المرحلة الثانية'),
            trailing: const Icon(Icons.chevron_left),
          ),
        )),
      ],
    ),
  );
}
