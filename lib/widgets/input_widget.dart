import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/utils/app_layout.dart';

class InputWidget extends StatefulWidget {
  final String label;
  final bool isPassword;
  final bool isNumber;
  final Function onChange;
  const InputWidget({Key? key, required this.label, this.isPassword = false, this.isNumber = false, required this.onChange})
      : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late String label;
  late bool isPassword;
  late bool _isNumber;
late Function _onChange;
  bool _isObscure = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    label = widget.label;
    isPassword = widget.isPassword;
    _isNumber= widget.isNumber;
    _onChange=widget.onChange;
    _isObscure = isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$label :",
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        Gap(AppLayout.getHeight(5)),
        TextField(
          keyboardType: _isNumber == true ? TextInputType.number : TextInputType.text,
          obscureText: _isObscure,
          onChanged: (result)=>_onChange(result),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
               suffixIcon: isPassword ? IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }):null,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
        Gap(AppLayout.getHeight(10)),
      ],
    );
  }
}
