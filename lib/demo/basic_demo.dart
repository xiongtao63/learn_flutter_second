import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  const BasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BasicDemo"),
      ),
      body: Container(
        height: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    NetworkImage("https://www.itying.com/images/flutter/5.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                colorFilter: ColorFilter.mode(
                    Colors.indigoAccent[400]!.withOpacity(0.6),
                    BlendMode.hardLight))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Icon(
                Icons.pool,
                size: 132,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  border: Border.all(
                      color: Colors.indigoAccent[100]!,
                      width: 3.0,
                      style: BorderStyle.solid),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(16, 20, 188, 1.0),
                        blurRadius: 25.0,
                        offset: Offset(0.0, 16.0),
                        spreadRadius: -9.0)
                  ],
                  shape: BoxShape.circle,
                  // gradient: RadialGradient(
                  //     colors: [
                  //   Color.fromRGBO(7, 102, 255, 1.0),
                  //   Color.fromRGBO(3, 28, 128, 1.0),
                  // ]
                  // )
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter

                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
