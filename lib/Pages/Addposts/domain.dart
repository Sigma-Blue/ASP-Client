// import 'package:flutter/material.dart';

// class domain extends StatefulWidget {
//   const domain({super.key});

//   @override
//   State<domain> createState() => _domainState();
// }

// class _domainState extends State<domain> {
//   List<String> domains = <String>['Job', 'Intern', 'Project', 'Research'];
//   String dropdownvalue = domains.first;
//   String value = dropdownvalue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: DropdownMenu<String>(
//       initialSelection: domains.first,
//       onSelected: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownvalue = value!;
//         });
//       },
//       dropdownMenuEntries:
//           domains.map<DropdownMenuEntry<String>>((String value) {
//         DropdownMenuEntry<String>(value: value, label: value);
//       }).toList(),
//     )));
//   }
// }
import 'package:flutter/material.dart';

const List<String> list = <String>['Job', 'Intern', 'Research', 'Project'];

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
          print(dropdownValue);
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
