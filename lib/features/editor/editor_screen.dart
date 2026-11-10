import 'package:flutter/material.dart';
import '../../app/theme.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  String recipient = 'اسم المستفيد';
  String heading = 'شهادة شكر وتقدير';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('محرر الشهادات'), actions: [
        IconButton(onPressed: () => _showInfo(context), icon: const Icon(Icons.info_outline)),
      ]),
      body: Column(children: [
        Expanded(
          child: Center(
            child: AspectRatio(
              aspectRatio: 1.414,
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.gold, width: 4),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12)],
                ),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: AppTheme.navy, width: 1)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(Icons.workspace_premium, color: AppTheme.gold, size: 34),
                    const SizedBox(height: 12),
                    Text(heading, style: const TextStyle(fontSize: 20, color: AppTheme.navy, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 18),
                    const Text('تُمنح هذه الشهادة إلى', style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 8),
                    Text(recipient, style: const TextStyle(fontSize: 24, color: AppTheme.gold, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 14),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Text('تقديرًا لجهوده المتميزة ومشاركته الفاعلة، مع خالص تمنياتنا له بدوام النجاح والتوفيق.',
                        textAlign: TextAlign.center, style: TextStyle(height: 1.7, color: Colors.black87)),
                    ),
                    const Spacer(),
                    const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Text('التوقيع', style: TextStyle(color: Colors.black54)),
                      Text('التاريخ', style: TextStyle(color: Colors.black54)),
                    ]),
                    const SizedBox(height: 12),
                  ]),
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(14),
          child: Row(children: [
            Expanded(child: OutlinedButton.icon(
              onPressed: () async {
                final value = await _askText(context, 'اسم المستفيد', recipient);
                if (value != null) setState(() => recipient = value);
              },
              icon: const Icon(Icons.edit), label: const Text('تعديل الاسم'),
            )),
            const SizedBox(width: 10),
            Expanded(child: FilledButton.icon(
              onPressed: () => _showInfo(context),
              icon: const Icon(Icons.save_outlined), label: const Text('حفظ التصميم'),
            )),
          ]),
        ),
      ]),
    );
  }

  Future<String?> _askText(BuildContext context, String title, String initial) async {
    final controller = TextEditingController(text: initial);
    return showDialog<String>(context: context, builder: (context) => AlertDialog(
      title: Text(title),
      content: TextField(controller: controller, textDirection: TextDirection.rtl, autofocus: true),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
        FilledButton(onPressed: () => Navigator.pop(context, controller.text), child: const Text('تطبيق')),
      ],
    ));
  }

  void _showInfo(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('هذه شاشة نموذج أولي. سيتم تنفيذ الحفظ ومحرك العناصر والتصدير في المراحل التالية.')),
    );
  }
}
