import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../utils/format_text.dart';

class NewArticleScreen extends StatefulWidget {
  @override
  _NewArticleScreenState createState() => _NewArticleScreenState();
}

class _NewArticleScreenState extends State<NewArticleScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _tagsController = TextEditingController();
  final _categoriesController = TextEditingController();

  List<String> _categories = [
    'Ciencia',
    'Literatura',
    'Política',
    'Biología',
    'Humanidades',
    'Sociales',
    'Informática'
  ];
  String? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 143, 150, 155),
        title: Text('New Article'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconSize: 30,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyles.titleStyleCard,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey[100]!),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _tagsController,
              decoration: InputDecoration(
                labelText: 'Tags',
                labelStyle: TextStyles.titleStyleCard,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey[100]!),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Categoria',
                labelStyle: TextStyles.titleStyleCard,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              value: _selectedCategory,
              hint: Text('Seleccione una categoría'),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 300, // Definir la altura que desees
              child: SingleChildScrollView(
                child: TextField(
                  maxLines: null,
                  controller: _contentController,
                  decoration: InputDecoration(
                    labelText: 'Contenido',
                    labelStyle: TextStyles.titleStyleCard,
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey[100]!),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: Text("Publish"),
              onPressed: () async {
                String title = _titleController.text;
                String contenido = _contentController.text;

                if (title.isEmpty || contenido.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Exception: No se puede registrar al usuario, campos vacíos.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(120, 40),
                textStyle: TextStyles.buttonStyle,
                primary: Colors.yellow,
                onPrimary: Colors.black87,
                elevation: 15,
                shadowColor: Colors.yellow,
                // side: BorderSide(color: Colors.black87, width: 2)
              ),
            )
          ],
        ),
      ),
    );
  }
}
