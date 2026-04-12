import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'КубГАУ',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CampusPage(),
    );
  }
}

class CampusPage extends StatefulWidget {
  const CampusPage({super.key});

  @override
  State<CampusPage> createState() => _CampusPageState();
}

class _CampusPageState extends State<CampusPage> {
  bool _isLiked = false;

  void _makeCall() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Вызов: +7 (861) 221-55-55')),
    );
  }

  void _showRoute() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Маршрут: г. Краснодар, ул. Калинина, 13')),
    );
  }

  void _share() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Поделиться информацией о кампусе')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кампус КубГАУ'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isLiked = !_isLiked;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_isLiked ? 'Добавлено в избранное' : 'Удалено из избранного'),
                  duration: const Duration(milliseconds: 800),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/kubsau.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text('Изображение не найдено'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Самый лучшие университет в мире',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Кубанский государственный аграрный университет имени И.Т. Трубилина (КубГАУ) — ведущий аграрный вуз России, крупнейший научно-образовательный центр в ЮФО, расположенный в Краснодаре. Основан в 1922 году, обучает более 16 000 студентов на 17 факультетах, предлагая программы от агрономии до экономики. Вуз имеет давние традиции международного сотрудничества и располагает конкурентоспособным потенциалом: высококвалифицированные кадрами, удобно расположенным кампусом (учебные корпуса, комфортные общежития, столовые, поликлиника, спортивные объекты, учебные лаборатории и мастерские и многое другое), хорошим учебно-методическим обеспечением, программами обучения с учетом индивидуальных запросов иностранных учащихся. Наряду с аудиторными занятиями на подготовительном отделении для иностранных граждан применяются инновационные формы и методы работы, летние языковые лагеря, трудовые и экскурсионные языковые практики и т.д. Студенческий городок Кубанского ГАУ состоит из двадцати общежитий. Всем нуждающимся обучающимся Подготовительного отделения Кубанского ГАУ предоставляются места для проживания в общежитиях университета в определенном порядке: слушателям Подфака, поступающим на факультеты Кубанского ГАУ места в общежитиях предоставляются в первую очередь, остальные слушатели заселяются на свободные места.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.call, color: Colors.green, size: 30),
                        onPressed: _makeCall,
                      ),
                      const Text('Позвонить'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.map, color: Colors.green, size: 30),
                        onPressed: _showRoute,
                      ),
                      const Text('Маршрут'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.green, size: 30),
                        onPressed: _share,
                      ),
                      const Text('Поделиться'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}