import 'package:flutter/material.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_layout.dart';

class SearchInputWidget extends StatefulWidget {
  final Function onChange;
  final String qrCodeAction;
  const SearchInputWidget({Key? key, required this.onChange, required this.qrCodeAction}) : super(key: key);

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  late Function onChange;
  late String qrCodeAction;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onChange=widget.onChange;
    qrCodeAction=widget.qrCodeAction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15),vertical: AppLayout.getHeight(10)),
      child: TextField(
         onChanged: (query) => onChange(query),
        // style:
        //TextStyle(color: AppColors.smallTextColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFedf0f8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: "Recherche par nom",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.scanObject, arguments: qrCodeAction);
            },
            child: Icon(
              Icons.qr_code_2_outlined,
              //color: AppColors.secondaryColor,
              size: AppLayout.getWidth(50),
            ),
          ),
          /*prefixIconColor: AppColors.secondaryColor*/),
      ),
    );
  }
}
