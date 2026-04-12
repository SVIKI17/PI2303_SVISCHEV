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

class CampusPage extends StatelessWidget {
  const CampusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('КубГАУ'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/kubsau.png',
              width: double.infinity,
              height: 500,
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
                'Лучший университет на свете',
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
          ],
        ),
      ),
    );
  }
}