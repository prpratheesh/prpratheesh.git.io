import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LoginPage> {
  TextEditingController barcodeController = TextEditingController();
  late FocusNode focusNode;
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    barcodeController.dispose();
    super.dispose();
  }

  Widget _title() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'L',
            style: GoogleFonts.portLligatSans(
              textStyle: Theme.of(context).textTheme.bodyLarge,
              fontSize: 50,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            children: const [
              TextSpan(
                text: 'abel ',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ),
              TextSpan(
                text: 'P',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.w900),
              ),
              TextSpan(
                text: 'rint',
                style: TextStyle(color: Colors.black87, fontSize: 40),
              ),
            ]),
      ),
    );
  }

  Widget _barcodeScan() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 20,
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
//      color: Colors.blue,
//      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: (Container(
//              width: MediaQuery.of(context).size.width / 1.3,
//                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  padding: const EdgeInsets.all(0),
                  child: TextFormField(
                    focusNode: focusNode,
                    autofocus: true,
                    textAlign: TextAlign.justify,
                    controller: barcodeController,
                    autocorrect: false,
                    decoration: const InputDecoration(
//                  prefixIcon: Icon(Icons.add_a_photo),
                      prefixText: "  Barcode     : ",
                      hintText: 'Scan or Enter Barcode',
                      filled: true,
                      fillColor: Color(0xFFDBEDFF),
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).unfocus();
                    },
                  )))),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return InkWell(
      onTap: () async {
        barcodeController.text = '';
        focusNode.requestFocus();
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: const Color(0xffdf8e33).withAlpha(10),
                  offset: const Offset(2, 4),
                  blurRadius: 10,
                  spreadRadius: 2)
            ],
            color: Colors.black),
        child: const Text(
          'SCAN',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      );
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFFB71731),
                      Color(0XFFB71731),
                      Color(0XFFA5004E),
                    ])),
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                        _title(),
                        _barcodeScan(),
                      ])),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "fl1",
          elevation: 9.0,
          tooltip: "SCAN",
          child: Icon(Icons.barcode_reader),
          backgroundColor: Colors.blueAccent,
          onPressed: () async {
            _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                context: context,
                onCode: (code) {
                  setState(() {
                    this.code = code;
                    barcodeController.text = code!;
                  });
                });
          }),
    );
  }
}
