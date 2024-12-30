import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    //Inicializamos el objeto que nos permitira usar funciones como limpiar la pantalla, etc
    final textController = TextEditingController();
    final focusNode = FocusNode();
    //Inicializamos este objeto y definimos las caracteristicas que tendran los bordes del chat
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(29));
    // inicializamos este objeto con las caractersiticas esteticas que queremos que tenga nuestro chat
    final inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        hintText: 'Termina tu mensaje con "?"',
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              onValue(textValue);
              textController.clear();
            },
            icon: Icon(Icons.send_outlined)));

    return TextFormField(
      decoration: inputDecoration,
      controller: textController,
      onTapOutside: (event) => focusNode.unfocus(),
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      focusNode: focusNode,
    );
  }
}
