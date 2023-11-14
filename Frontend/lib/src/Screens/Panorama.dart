import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class PanoramaViewe extends StatefulWidget {
  final List<String> imageUrls;

  PanoramaViewe({required this.imageUrls});

  @override
  _PanoramaViewerState createState() => _PanoramaViewerState();
}

class _PanoramaViewerState extends State<PanoramaViewe> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PanoramaViewer(
                    animSpeed: 1.0,
                    child: Image.asset(
                      widget.imageUrls[currentIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.imageUrls.map((url) {
                    int index = widget.imageUrls.indexOf(url);
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index
                            ? Color.fromRGBO(255, 255, 255, 0.9)
                            : Color.fromRGBO(255, 255, 255, 0.4),
                      ),
                    );
                  }).toList(),
                ),
                // Botón para pasar a la siguiente imagen
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                   
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 0, 0, 0)),
                        
                      ),
                      
                      child: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        // Actualiza el índice actual de la imagen
                        if (currentIndex > 0) {
                          setState(() {
                            currentIndex--;
                          });
                        }
                      },
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 0, 0, 0)),
                        
                      ),
                      
                      child: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        // Actualiza el índice actual de la imagen
                        if (currentIndex < widget.imageUrls.length - 1) {
                          setState(() {
                            currentIndex++;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

