// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
//
// class DropDownButtonLocal extends StatelessWidget {
//   final String title;
//   final String errorTitle;
//   final List<Genre> itemList;
//   final Genre initialValue;
//   final void Function(Genre? newValue) callback;
//
//   const DropDownButtonLocal(
//       {Key? key,
//       required this.title,
//       required this.errorTitle,
//       required this.itemList,
//       required this.initialValue,
//       required this.callback})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.065,
//         width: MediaQuery.of(context).size.width * 0.9,
//         decoration: BoxDecoration(
//           color: const Color(0xFF767680).withOpacity(0.24),
//           borderRadius: const BorderRadius.all(
//             Radius.circular(16),
//           ),
//         ),
//         child: DropdownButtonFormField2(
//           value: initialValue,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.zero,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             enabledBorder: InputBorder.none
//           ),
//           isExpanded: true,
//           hint: Text(
//             title,
//             style: TextStyle(
//               fontSize: 17,
//               color: Theme.of(context).textTheme.titleSmall?.color,
//             ),
//           ),
//           icon: const Icon(
//             Icons.arrow_drop_down,
//             color: Colors.white,
//           ),
//           iconSize: 30,
//           buttonHeight: 60,
//           buttonPadding: const EdgeInsets.only(left: 20, right: 10),
//           dropdownDecoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           items: itemList
//               .map(
//                 (item) => DropdownMenuItem<Genre>(
//                   value: item,
//                   child: Text(
//                     item.title,
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Theme.of(context).textTheme.titleSmall?.color,
//                     ),
//                   ),
//                 ),
//               )
//               .toList(),
//           validator: (value) {
//             if (value == null) {
//               return errorTitle;
//             }
//           },
//           onChanged: callback,
//           // onSaved: callback,
//         ),
//       ),
//     );
//   }
// }
