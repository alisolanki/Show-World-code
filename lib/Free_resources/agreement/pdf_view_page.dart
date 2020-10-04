import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
import 'package:share/share.dart';

class PdfViewPage extends StatelessWidget {
  final String _path;
  PdfViewPage(this._path);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          title: const Text(
            'Agreement',
            style: TextStyle(
              fontFamily: "roboto",
              fontWeight: FontWeight.w600,
              color: Color(0xff1b4f72),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff1b4f72),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () => Share.shareFiles([_path]),
            )
          ],
        ),
      ),
      path: _path,
    );
  }
}
