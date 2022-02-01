import 'package:flutter/material.dart';
import 'package:student_portal/models/products.dart';

class SellProduct extends StatefulWidget {
  const SellProduct({Key? key}) : super(key: key);

  @override
  _SellProductState createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  final TextEditingController _prodNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _productName = '';
  String _description = '';
  String _category = '';
  double _price = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 100,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                  child: Text(
                'Sell A Product',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat',
                    fontSize: 48),
              )),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'PRODUCT NAME',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // validator: (value) {
                      //   if (value!.isEmpty ||
                      //       value.length <= 10 ||
                      //       value.length > 11) {
                      //     return 'Invalid SAP ID';
                      //   }
                      // },
                      onSaved: (value) {
                        _productName = value.toString();
                      },
                      textAlign: TextAlign.left,
                      controller: _prodNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Product Name',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'PRICE',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _price = value as double;
                      },
                      textAlign: TextAlign.left,
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Price(Rs)',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      // validator: (text) {
                      //   if (text == null || text.isEmpty) {
                      //     return 'Can\'t be empty';
                      //   }
                      //   if (!text.contains('@') ||
                      //       !text.contains('.com') ||
                      //       text.length < 6) {
                      //     return 'Invalid Email';
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'DESCRIPTION',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onSaved: (value) {
                        _description = value.toString();
                      },
                      textAlign: TextAlign.left,
                      controller: _descriptionController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      // validator: (text) {
                      //   if (text == null || text.isEmpty) {
                      //     return 'Can\'t be empty';
                      //   }
                      //   if (text.length < 4) {
                      //     return 'Too short';
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'CATEGORY',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      items: ['Books', 'Electronics', 'Stationary', 'Others']
                          .map<DropdownMenuItem<String>>(
                        (String val) {
                          return DropdownMenuItem(
                            child: Text(val),
                            value: val,
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          _category = val.toString();
                        });
                      },

                      decoration: InputDecoration(
                        hintText: 'Select Category',
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(16),
                      ),
                      // validator: (text) {
                      //   if (text == null || text.isEmpty) {
                      //     return 'Can\'t be empty';
                      //   }
                      //   if (text.length < 4) {
                      //     return 'Too short';
                      //   }
                      //   if (text != _descriptionController.text) {
                      //     return 'Check Entered passwords';
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: RaisedButton(
                  elevation: 0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.black,
                  child: Text(
                    'ADD PRODUCT',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  onPressed: () {
                    //products.add(Products())
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
