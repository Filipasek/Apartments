import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 250.0,
              margin: const EdgeInsets.fromLTRB(
                6.0,
                4.0,
                6.0,
                10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 211, 231, 212),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Aktualności',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Jesteś na bieżąco!'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
