import 'package:flutter/material.dart';

class ItemFormularioNumber extends StatelessWidget {
  final textoTitulo;
  final lbldecorator;

  const ItemFormularioNumber({
    required Key? key,
    required TextEditingController controller,
    required this.node,
    this.textoTitulo,
    this.lbldecorator,
  })  : controller = controller,
        super(key: key);

  final TextEditingController controller;
  final FocusScopeNode node;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.all(15.0)),
        Text(textoTitulo),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: lbldecorator),

          validator: (value) {
            if ((value?.isEmpty)!) {
              return 'Debe llenar este campo';
            }
          },
          //focusNode: this.controllerNode,
          //onEditingComplete: () => requestFocus(context, fechaNacimientoNode),
          onEditingComplete: () => node.nextFocus(),
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}
