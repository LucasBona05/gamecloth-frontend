import 'package:flutter/material.dart';
import 'package:gamecloth_frontend/components/add_button.dart';
import 'package:gamecloth_frontend/components/simple_error_dialog.dart';
import 'package:gamecloth_frontend/controllers/product_controller.dart';
import 'package:gamecloth_frontend/models/product.dart';
import 'package:gamecloth_frontend/pages/new_product_page/new_product_page_view_model.dart';
import 'package:gamecloth_frontend/utils/constants.dart';
import 'package:gamecloth_frontend/utils/functions/functions.dart';
import 'package:gamecloth_frontend/utils/style/colors.dart';

class EditProductPage extends StatefulWidget {
  final Product product;
  const EditProductPage({ Key? key, required this.product }) : super(key: key);

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _formKey = GlobalKey<FormState>();
  late String dropdownValue;
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerImage = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();

  @override
  void initState() {
    controllerTitle.text = widget.product.title;
    controllerImage.text = widget.product.image;
    controllerPrice.text = widget.product.price.toString();
    dropdownValue = parseEnumGame(widget.product.game);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        brightness: Brightness.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                mainText(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CreateProductFormField(
                          controller: controllerTitle,
                          inputName: 'NOME',
                          inputDecoration: kTextFormFieldTitleInputDecoration,
                          isNumerical: false,
                        ),
                        CreateProductFormField(
                          controller: controllerImage,
                          inputName: 'IMAGEM',
                          inputDecoration: kTextFormFieldImageInputDecoration,
                          isNumerical: false,
                        ),
                        CreateProductFormField(
                          controller: controllerPrice,
                          inputName: 'PREÇO',
                          inputDecoration: kTextFormFieldMoneyInputDecoration,
                          isNumerical: true,
                        ),
                        selectGameDropdown(),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: GameClothButton(
                            icon: Icons.add,
                            iconColor: primaryTextColor,
                            height: MediaQuery.of(context).size.height * 0.06,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bool response = await ProductController()
                                    .alterProduct(
                                        idProduct: widget.product.idProduct,
                                        title: controllerTitle.text,
                                        image: controllerImage.text,
                                        price:
                                            double.parse(controllerPrice.text),
                                        game: dropdownValue);
                                if (response) {
                                  Navigator.pop(context);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleErrorDialog();
                                    },
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
}
Column selectGameDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            'JOGO',
            style: kTextFormFieldLabelStyle,
          ),
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(
            Icons.arrow_downward_rounded,
          ),
          iconEnabledColor: descriptionCardColor,
          iconSize: 24,
          elevation: 16,
          style: kCardTitleTextStyle,
          dropdownColor: backgroundColor,
          underline: Container(
            height: 3,
            color: accentColor,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: gamesList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Column mainText() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'EDITAR\nPRODUTO',
            style: kAppTitle,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Edite os produtos\nda sua loja',
            style: kAppDescript_2,
          ),
        ),
      ],
    );
  }
}

class CreateProductFormField extends StatelessWidget {
  final String inputName;
  final TextEditingController controller;
  final InputDecoration inputDecoration;
  final bool isNumerical;
  const CreateProductFormField({
    Key? key,
    required this.inputName,
    required this.controller,
    required this.inputDecoration,
    required this.isNumerical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            inputName,
            style: kTextFormFieldLabelStyle,
          ),
        ),
        TextFormField(
          keyboardType: isNumerical ? TextInputType.number : TextInputType.text,
          controller: controller,
          decoration: inputDecoration,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'O valor deve ser preenchido';
            }
          },
        ),
      ],
    );
  }
}