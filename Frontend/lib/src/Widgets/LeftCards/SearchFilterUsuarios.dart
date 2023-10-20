import 'package:flutter/material.dart';

class SearchFilterUsuarios extends StatelessWidget {
  const SearchFilterUsuarios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: const Color(0xFF3D3D3D),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
              spreadRadius: 0,
            ),
          ],
        ),
        height: 280,
        width: 250,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // Ajustar el espacio verticalmente
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Filtro',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  10.0), // Ajusta el espacio entre el texto y el TextField
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nombre o cedula',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  10.0), // Ajusta el espacio entre el TextField y el Dropdown
              child: _buildDropdownMenu("Grupo",
                  const OutlineInputBorder(borderSide: BorderSide.none)),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  10.0), // Ajusta el espacio entre el Dropdown y el botón
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  fixedSize: const Size(100, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text('Buscar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownMenu(String hintText, InputBorder border) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.0),
        color: Colors.white,
      ),
      child: DropdownMenu<String>(
        initialSelection: 'Rol',
        onSelected: (String? value) {},
        dropdownMenuEntries: <String>['A', 'B', 'Rol'].map((String value) {
          return DropdownMenuEntry<String>(
            value: value,
            label: value,
          );
        }).toList(),
      ),
    );
  }
}
