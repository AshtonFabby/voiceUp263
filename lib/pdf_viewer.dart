import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfViewer extends StatefulWidget {
  // const PdfViewer({Key? key}) : super(key: key);
  final txt;
  PdfViewer({Key? myKey, this.txt}) : super(key: myKey);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.txt}"),
        backgroundColor: Colors.indigo[800],
      ),
      body: SfPdfViewer.asset("assets/pdf/${widget.txt}.pdf"),
    );
  }
}
