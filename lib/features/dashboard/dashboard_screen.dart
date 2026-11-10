import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../templates/templates_screen.dart';
import '../editor/editor_screen.dart';
import '../projects/projects_screen.dart';
import '../organizations/organizations_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = <_DashboardAction>[
      _DashboardAction('إنشاء شهادة', 'ابدأ تصميمًا جديدًا', Icons.add_circle_outline,
          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditorScreen()))),
      _DashboardAction('القوالب', 'قوالب قابلة للتعديل', Icons.dashboard_customize_outlined,
          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TemplatesScreen()))),
      _DashboardAction('مشاريعي', 'التصاميم المحفوظة', Icons.folder_open_outlined,
          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProjectsScreen()))),
      _DashboardAction('المؤسسات', 'الشعارات والهويات', Icons.business_outlined,
          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OrganizationsScreen()))),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('صانع الشهادات الاحترافي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Professional Certificate Maker', style: TextStyle(fontSize: 10, color: Colors.white70)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined), tooltip: 'الإعدادات'),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.navy, Color(0xFF263F5C)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.workspace_premium, color: AppTheme.gold, size: 36),
                  SizedBox(height: 12),
                  Text('حوّل أفكارك إلى شهادات استثنائية',
                    style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('صمّم، خصّص، واحفظ شهاداتك بجودة احترافية دون إنترنت.',
                    style: TextStyle(color: Colors.white70, height: 1.6)),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text('ابدأ العمل', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: actions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.18,
              ),
              itemBuilder: (context, index) {
                final item = actions[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: item.onTap,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item.icon, color: AppTheme.gold, size: 30),
                          const Spacer(),
                          Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text(item.subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Text('ملخص العمل', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Row(
              children: [
                Expanded(child: _StatCard(label: 'المشاريع', value: '0', icon: Icons.folder_copy_outlined)),
                SizedBox(width: 10),
                Expanded(child: _StatCard(label: 'الشهادات الصادرة', value: '0', icon: Icons.verified_outlined)),
              ],
            ),
            const SizedBox(height: 16),
            const Text('ملاحظة: هذه نسخة تأسيسية للواجهة. سيتم ربط الإحصاءات والأقسام بقاعدة البيانات في المراحل التالية.',
              style: TextStyle(fontSize: 11, color: Colors.grey, height: 1.5)),
          ],
        ),
      ),
    );
  }
}

class _DashboardAction {
  const _DashboardAction(this.title, this.subtitle, this.icon, this.onTap);
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value, required this.icon});
  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Row(children: [
        Icon(icon, color: AppTheme.gold),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(fontSize: 11)),
        ])),
      ]),
    ),
  );
}
