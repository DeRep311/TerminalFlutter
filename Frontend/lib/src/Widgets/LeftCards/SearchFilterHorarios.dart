import 'package:flutter/material.dart';

class SearchFilterHorarios extends StatelessWidget {
  const SearchFilterHorarios({Key? key}) : super(key: key);

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
        height: 500,
        width: 250,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(
                  10.0), // Agrega un padding de 10.0, que es aproximadamente un centímetro
              child: _buildDropdownMenu("Docente a cargo"),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  10.0), // Agrega un padding de 10.0, que es aproximadamente un centímetro
              child: _buildDropdownMenu("Grupo"),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  10.0), // Agrega un padding de 10.0, que es aproximadamente un centímetro
              child: _buildDropdownMenu("Salón"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownMenu(String hintText) {
    return DropdownMenu<String>(
      initialSelection: 'A',
      onSelected: (String? value) {},
      dropdownMenuEntries: <String>['A', 'B', 'C', 'D'].map((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }
}
