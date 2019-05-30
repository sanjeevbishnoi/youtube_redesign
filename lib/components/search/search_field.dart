import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchField extends StatefulWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String query;

  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  @override
  void dispose() {
    if(_focusNode !=null && _controller!=null){
      
      _focusNode.dispose();
      _controller.dispose();

    }

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
  data: Theme.of(context).copyWith(splashColor: Colors.transparent),
  child:TextField(
      autofocus: true,
    style: TextStyle(fontSize: 16.0, color: Colors.grey),
      decoration: InputDecoration(
       contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 14.0),
        focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFbdc6cf)),
        borderRadius: BorderRadius.circular(25.7),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.7),
      ),
        
        hintText: 'Search videos',
        filled: true,
      fillColor: Colors.white,
        border: InputBorder.none,
        
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black.withOpacity(0.5),
        ),
        suffixIcon: Icon(Icons.keyboard_voice,color: Colors.black.withOpacity(0.5))
  
      ),
      onSubmitted: (searchQuery) {
        
      },
      
      controller: _controller,
      focusNode: _focusNode,
    ));
  }

  
}