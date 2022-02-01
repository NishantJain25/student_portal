import 'package:flutter/material.dart';
import 'package:student_portal/models/products.dart';

class ListAccommodation extends StatefulWidget {
  const ListAccommodation({Key? key}) : super(key: key);

  @override
  _ListAccommodationState createState() => _ListAccommodationState();
}

class _ListAccommodationState extends State<ListAccommodation> {
  final TextEditingController _prodNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amenitiesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _propertyName = '';
  String _description = '';
  String _category = '';
  String _address = '';
  double _rent = 0;
  List<String> _amenities = [];
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
                'List A Property',
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
                        'PROPERTY NAME',
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
                        _propertyName = value.toString();
                      },
                      textAlign: TextAlign.left,
                      controller: _prodNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Property Name',
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
                        'ADDRESS',
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
                        _address = value.toString();
                      },
                      textAlign: TextAlign.left,
                      controller: _descriptionController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Address',
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
                        'AMENITIES',
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
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            controller: _amenitiesController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Amenities',
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
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(0),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(16)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              onPressed: () => setState(() {
                                    _amenities
                                            .contains(_amenitiesController.text)
                                        ? null
                                        : _amenities.add(_amenitiesController
                                            .text
                                            .toUpperCase());
                                    _amenitiesController.clear();
                                  }),
                              child: Text(
                                'Add',
                                style: TextStyle(
                                    fontFamily: 'Montserrat', fontSize: 16),
                              )),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 15,
                      runSpacing: 10,
                      children: [
                        for (var i = 0; i < _amenities.length; i++)
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10, bottom: 10),
                                    child: Text(
                                      _amenities[i],
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () => setState(() {
                                            _amenities.removeAt(i);
                                          }),
                                      icon: Icon(Icons.cancel))
                                ],
                              ))
                      ],
                    )
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
                        'RENT',
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
                        _rent = value as double;
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
                        'PAYMENT PERIOD',
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
                      items: ['Yearly', 'Monthly', 'Quarterly']
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
                        hintText: 'Select Duration',
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
                    'ADD PROPERTY',
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
