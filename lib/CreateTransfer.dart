import 'package:flutter/material.dart';
import '../models/user.dart';
import 'CheckoutItems.dart';
import 'api/api_service.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  APIService service = APIService();


  TextEditingController authorizing_officer = TextEditingController();
  TextEditingController issuing_officer = TextEditingController();
  TextEditingController receiving_officer_id = TextEditingController();
  TextEditingController requisitioning_officer_id = TextEditingController();
  // map["movement_date"] = pass;
  TextEditingController description = TextEditingController();
  TextEditingController document_reference = TextEditingController();
  TextEditingController source_location_id = TextEditingController();
  TextEditingController target_location_id = TextEditingController();
  TextEditingController responsible_person = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CREATE TRANSFER')),
        resizeToAvoidBottomInset : false,
        body: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Source'),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Source';
                              }
                            },
                            controller: source_location_id,
                            onSaved: (String? val) =>
                                setState(() => _user.firstName = val!),
                          ),
                          TextFormField(
                              decoration: InputDecoration(labelText: 'Target'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter target';
                                }
                              },
                              controller: target_location_id,
                              onSaved: (String? val) =>
                                  setState(() => _user.lastName = val!)),
                          TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Requisitioning Officer'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter R.O';
                                }
                              },
                              onSaved: (String? val) =>
                                  setState(() => _user.lastName = val!)),
                          TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Authorizing Officer'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Authorizing Officer';
                                }
                              },
                              controller: authorizing_officer,
                              onSaved: (String? val) =>
                                  setState(() => _user.lastName = val!)),
                          TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Issuing Officer'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Issuing Officer';
                                }
                              },
                              controller: issuing_officer,
                              onSaved: (String? val) =>
                                  setState(() => _user.lastName = val!)),
                          TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Receiving Officer'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Receiving Officer';
                                }
                              },
                              controller: receiving_officer_id,
                              onSaved: (String? val) =>
                                  setState(() => _user.lastName = val!)),
                          TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Description'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Descripton';
                                }
                              },
                              controller: description,
                              onSaved: (String? val) =>
                                  setState(() => _user.lastName = val!)),
                                  TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Person Responsible'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Person Responsible';
                                }
                              },
                              controller: responsible_person,
                              onSaved: (String? val) =>
                                  setState(() => _user.lastName = val!)),
                                  TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Reference Document'),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Reference Document';
                                }
                              },
                              controller: document_reference,
                              onSaved: (String? val) =>
                                  setState(() => _user.lastName = val!)),
                          //   Container(
                          //     padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                          //     child: Text('Subscribe'),
                          //   ),
                          //   SwitchListTile(
                          //       title: const Text('Monthly Newsletter'),
                          //       value: _user.newsletter,
                          //       onChanged: (bool val) =>
                          //           setState(() => _user.newsletter = val)),
                          //   Container(
                          //     padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                          //     child: Text('Interests'),
                          //   ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: RaisedButton(
                                  onPressed: () async{
                                    final form = _formKey.currentState;
                                    if (form!.validate()) {
                                      form.save();
                                      _user.save();
                                      _showDialog(context);
                                      
                                      service.postMovements(
                                        source_location_id.text.trim(), 
                                        target_location_id.text.trim(), 
                                        receiving_officer_id.text.trim(), 
                                        authorizing_officer.text.trim(), 
                                        issuing_officer.text.trim(), 
                                        requisitioning_officer_id.text.trim(), 
                                        description.text.trim(), 
                                        responsible_person.text.trim(), 
                                        document_reference.text.trim(),
                                      ).then((value) =>{
                                        Navigator.of(context).pop(),
                                        Navigator.of(context).pop(),
                                        Navigator.push(context,
                                      MaterialPageRoute(builder: (_) => CheckOutItems()))
                                      });

                                      //redirect to checkout
                                      
                                    }
                                  },
                                  child: Text('Save'))),
                        ])))));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}
