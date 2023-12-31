// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DropDownSelect extends StatefulWidget {
  final List<String> options;
  final String? selectedValue;
  final Function(String?) OnChanged;
  final String label;
  final Color color; // Add this line
  final EdgeInsets? margin;

  DropDownSelect({
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.OnChanged,
    required this.color, // And this line
    this.margin,
  });

  @override
  _DropDownSelectState createState() => _DropDownSelectState();
}

class _DropDownSelectState extends State<DropDownSelect> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dropdownValue = widget.label;

    return Container(
      height: 50,
      width: 230,
      alignment: Alignment.center,
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: widget.color, // Use the color here
      ),
      child: DropdownMenu<String>(
        width: 210,
        hintText: dropdownValue,
        inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
        dropdownMenuEntries: widget.options.map((String e) {
          return DropdownMenuEntry<String>(
            value: e,
            label: e!,
          );
        }).toList(),
        onSelected: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
          widget.OnChanged(value!);
        },
      ),
    );
  }
}




















// class DropDownSelect extends StatefulWidget {
//   final List<String> options;
//   final String? selectedValue;
//   final Function(String?) OnChanged;
//   final String label;

//   DropDownSelect({
//     required this.label,
//     required this.options,
//     required this.selectedValue,
//     required this.OnChanged,
//   });

//   @override
//   _DropDownSelectState createState() => _DropDownSelectState();
// }

// class _DropDownSelectState extends State<DropDownSelect> {
//   late String dropdownValue;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     dropdownValue = widget.label;

//     return Container(
//       height: 50,
//       width: 230,
//       alignment: Alignment.center,
//       margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24.0),
//           color: Color.fromARGB(255, 255, 255, 255)),
//       child: DropdownMenu<String>(
//         width: 210,
//         hintText: dropdownValue,
//         inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
//         dropdownMenuEntries: widget.options.map((String e) {
//           return DropdownMenuEntry<String>(
//             value: e,
//             label: e!,
//           );
//         }).toList(),
//         onSelected: (String? value) {
//           setState(() {
//             dropdownValue = value!;
//           });
//           widget.OnChanged(value!);
//         },
//       ),
//     );
//   }
// }
