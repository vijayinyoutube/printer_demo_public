import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Printer Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            printDoc();
          },
          child: const Text("Print"),
        ),
      ),
    );
  }

  Future<void> printDoc() async {
    print("INSIDE FUNCTION");
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello World'),
          ); 
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
    print("DONE"); 
  }
}
