import 'dart:io';

import 'package:ShowWorld/Free_resources/agreement/model/agreement_model.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<String> generateDocument(AgreementModel _agreementModel) async {
  final pw.Document pdf = pw.Document(
    title: "Artists and Technicians Agreement",
    author: 'Show World Film Directory',
  );

  final PdfImage logoImage = PdfImage.file(
    pdf.document,
    bytes:
        (await rootBundle.load('assets/logofilled.png')).buffer.asUint8List(),
  );

  pdf.addPage(
    pw.MultiPage(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32.0),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
            level: 0,
            child: pw.Row(
              children: [
                pw.Text("Artists' / Technicians' Agreement"),
                pw.Container(width: 70.0),
                pw.Container(
                  height: 20.0,
                  width: 20.0,
                  child: pw.Image(logoImage),
                ),
                pw.Container(width: 5.0),
                pw.Text("Created using SHOW WORLD FILM DIRECTORY"),
              ],
            ),
          ),
          pw.Paragraph(
            text:
                "The Agreement made at ${_agreementModel.place} this ${_agreementModel.day} day of ${_agreementModel.month} BY AND BETWEEN ${_agreementModel.producerName} Co. having its office at ${_agreementModel.place} (hereinafter referred to as the 'PRODUCER' which expression shall, unless inconsistent with the context or meaning thereof, be deemed to include its heirs, representatives, successors and permitted assigns) of the First Part: AND ${_agreementModel.artistName} an adult, Residing at ${_agreementModel.place} PAN No ${_agreementModel.panNumber} (Hereinafter referred to as 'THE ARTISTE/TECHNICIAN', Which expression shall, unless it be repugnant to the context or meaning thereof, be deemed to include him heirs, representatives successors and permitted assigns) of Second Part.",
          ),
          pw.Header(
            level: 1,
            child: pw.Text("RECITALS:"),
          ),
          pw.Bullet(
            text:
                "WHEREAS Producer is engaged in the business of production, distribution and marketing of cinematographic films, including feature films, advertisement films, television serials etc. and other works within the meaning of the copyright Act,  1957, for worldwide exploitations on all formats.",
          ),
          pw.Bullet(
            text:
                "WHEREAS The ARTISTE/TECHNICIAN has represented to the PRODUCER that he/she would like to work in the film and being Major is capable of signing the agreement.",
          ),
          pw.Bullet(
            text:
                "AND WHEREAS The PRODUCER has agreed to assign the Artiste/Technician and the ARTISTE/TECHNICIAN has agreed and confirmed to work as ${_agreementModel.artistWorkingName} in forthcoming production tentatively titled as ${_agreementModel.productionTitle} being produced by the PRODUCER and being Directed by ${_agreementModel.directorName}.",
          ),
          pw.Bullet(
            text:
                "AND WHEREAS Producer is desirous of availing the services of the Artiste/Tech. In the form and manner and for the consideration more particularly described hereunder and the Artiste/Tech. has agreed to provide such services ARTISTE/TECHNICIAN is the member of ${_agreementModel.artistAssociaName} Association.",
          ),
          pw.Bullet(
            text:
                "And WHEREAS The Parties have agreed to enter into an Agreeement to govern the terms and conditions of their association,  In consideration of their respective obligations, convenants, rights and warranties, confirmations and representations herein contained, the parties hereby agree as follows:",
          ),
          pw.Paragraph(
            text:
                "NOW THE AGREEMENT WITNESSETH AND IT IS HEREBY AGREED BY AND BETWEEN THE PARTIES AS FOLLOWS:",
          ),
          pw.Header(
            level: 1,
            child: pw.Text("1. COMMENCEMENT AND VALIDITY"),
          ),
          pw.Paragraph(
            text:
                "This Agreement shall come into force from signing the agreement and shall stand valid till the television/theatrical release of  the film and valid for post release promotion in name, photographs, character, voice likeness, including but not limited to promoting associates and sponsors of the films, events etc. Howeever the Artiste/Techn. understands that in case he/she is required to re-shoot certain scenes subsequent to the release of the said Film, and then he/she make himself available for the same at no additional remuneration.",
          ),
          pw.Header(
            level: 1,
            child: pw.Text("2. OBLIGATION OF THE ARTISTE/TECHNICIAN"),
          ),
          pw.Bullet(
            text:
                "The A/T agrees, warrants and undertakes to perform his work, grant and allot the dates for the shoot of the Film. All and any dates are required for the shooting, dubbing and/or any other activity shall be informed to A/T in due course of time and he agrees to accommodate dates as required by the Producers on urgent priority basis. In case the Producers are not able to complete his work within the allotted dates owing to any force like an Act of God, an Act/Accident of Sovereign, Govt. Sanction, War, Riot, Trade embargo, Blockage, Bandh, Failure or Interruption by/in Utility Service, Labour dispute, illness/breach of contract by any essential personnel inclement weather etc. and/or for any other reason, A/T shall allot more dates as essentially required by the Producers. The above confirmation is irrevocable and do hereby grant.",
          ),
          pw.Bullet(
            text:
                "The Artiste/Techn undertakes not to  indulge in any activity that is considered illegal as per the Laws prevalent in India, If any such acts of his/her hampers the smooth production of the said motion picture, the Artistes/Tech. alone shall be held responsible to make good the losses suffered by the producers.",
          ),
          pw.Bullet(
            text:
                "Artiste/Techn. Hereby gives consent, subject to statutory provisions contained therein of all the applicable enactment of copyright or Designs Act or any statute or amendment thereof of the statute of like purpose for the time being in force to the producer to make the fullest use of Artiste/Tech. Services provided by the Artist/Techn. hereunder",
          ),
          pw.Bullet(
            text:
                "The Artiste/Tech. Undertakes that he/she shall during the subsistence of and subject to the term and conditions of the agreement as where and when required by the producer :- (a) perform and record the Artiste's / Tech. Part (b) attend for tests, conferences, sittings, rehearsals and other arrangements (c) dress, make up and wear costumes as directed by the Director and generally comply with all decisions of the producer concerning the manner in which the Artiste/Techn. Shall render the Artiste's/Tech. Services hereunder and be portrayed and presented during the scheduled specified by Producer. (e) That the ARTISTE / TECH. Shall not give any Press or T.V.  interviews Independently regarding Producer or Film without the expressed consent of PRODUCER and in case of Interviews, he/she shall never use derogatory remarks directly or indirectly for Film, Producer, its Directors or Associates or Artistes & Technicians whatsoever If so he/she will be liable for legal action and to pay damages to the party concerned. (f) Artist / Techn agrees to comply with all requirements, directions and requests, and with all reasonable rules and regulations made by Producer. (g) The Artiste represents and warrants to Producer that the Artiste/ Techn is a major and has every legal right to enter into this Agreement to perform as herein stated, and that there are neither any contracts, agreements, or any understandings with anyone, restricting or preventing A/T from performing  obligations as set forth in this Agreement nor any subsisting contracts, agreements or understandings with any other person or his/her family in respect of which the Agreement is entered into. (h) Producer shall be insuring the Artiste/Techn for reasonable risks related to the shooting of the present film. However, the Artiste/Techn. Undertakes not to take unnecessary risks and adhere to the guidelines given to him by the producers.",
          ),
          pw.Header(
            level: 2,
            child: pw.Text("The Artist/Tech. further undertakes:"),
          ),
          pw.Paragraph(
            text:
                "1) That all commercial exploitation of the project world wide in all available streams shall solely be the prerogative of the producer or its assigns/nominees. Such commercial exploitation shall include but not be restricted to exhibition, distribution, licensing, franchising, shows, merchandising, music rights, television and electronic media rights, internet, but also any other avenues as may become available.",
          ),
          pw.Paragraph(
            text:
                "2) That A/T do hereby declare that A/T is signing this agreement on having convinced A/T of the contents, script steps and the price in totality. That the income tax or any other taxes of the Govt. authorities liable to be paid on A/T agreement and remuneration shall be paid by A/T directly to the concerned authorities.",
          ),
          pw.Paragraph(
            text:
                "3) Except with the consent of the PRODUCER and to the judgement of the Director, no performance will be given by the said Artist/Techn. which shall be obscene or defamatory or offensive to any religion or infringe any right of copyright or privacy and shall comply with all applicable laws of the land in this respect.",
          ),
          pw.Paragraph(
            text:
                "4) to not reveal to any person or make public any information whatever concerning the project, the business of the Producer and this Agreement without the prior written permission of the Producer in that regard;",
          ),
          pw.Paragraph(
            text:
                "5) to take all steps, sign all documents and comply with all requirements are reasonably necessary for the producer to obtain insurance or other similar facilitation for the project;",
          ),
          pw.Paragraph(
            text:
                "6) Not to indulge in any activity or participate in any transaction, which is likely to jeopardize, restrict or diminish the marketability, feasibility or completion of the Project.",
          ),
          pw.Paragraph(
            text:
                "7) to keep strictly secret  and confidential the script, artistic content, characterization and treatment of the Project, save and except for producer approved for the promotion of the project;",
          ),
          pw.Header(
            level: 1,
            text: "3. OBLIGATIONS OF THE PRODUCER FOR SHOOT / VISIT.",
          ),
          pw.Bullet(
            text:
                "The artiste/Tech. will be provided suitable accommodation by the Producer during stay for the project at the producers cost.",
          ),
          pw.Bullet(
            text:
                "All meals will be provided by the producer at the producer's cost.",
          ),
          pw.Bullet(
            text:
                "The Artiste/Tech. will be provided with all local transportation during the stay for filming by the Producer at the Producer's cost.",
          ),
          pw.Bullet(
            text: "No allowance will be paid.",
          ),
          pw.Bullet(
            text:
                "All Travel tickets will be paid for film shooting and for publicity by the Producer or its assigns.",
          ),
          pw.Header(
            level: 1,
            text: "4. INTELLECTUAL PROPERTY RIGHTS",
          ),
          pw.Bullet(
            text:
                "The Artiste/Tech. hereby agrees, confirms and warrants that the work performed by him/her shall be 'work made for hire' as per the Copyright Act and that Artiste/Tech. shall have no right, title interest or other claim whatsoever over the project and the entirety of the copyright over the film or the work generated as a result of the Project shall vest with the Producer in perpetuity (Universal). The Artiste/Tech. hereby specifically assigns, for the consideration received under the Agreement, the entirety of any right that may accrue to Artist/Tech. in respect of the Project under the provisions of the Copyrights Act, 1957 or any other applicable law.",
          ),
          pw.Bullet(
            text:
                "The Producers shall be entitled to assign the benefit and the burden of the Agreement in whole or in part any time at their discretion whereas the A/T shall not be entitled to assign the benefits in favor of any party.",
          ),
          pw.Bullet(
            text:
                "The Artiste/Tech. shall not exploit for A/T Personal profit or gain any of the characters (and/or any adaptions thereof) that are created for the project irrespective of the fact that such character was portrayed by the Artiste/Techn in the Project, not limited to music videos/ stage shows etc.",
          ),
          pw.Bullet(
            text:
                "The Producers shall be entitled to change the title and/or make or dub the same in any other language if and when necessitated at their exclusive discretion and option and/or under legal compulsion. Likewise it is hereby further agreed that in the event the Producers finding it necessary or unavoidable to make changes in the star cast or replace any technician or artistes for any reason whatever the A/T shall not object to the same and further agrees to support such action of the Producer.",
          ),
          pw.Header(
            level: 1,
            text: "5. REMUNERATION",
          ),
          pw.Paragraph(
            text:
                "A) In consideration for providing the Services at the dates, times and locations informed by the producer from time to time, Producer shall pay the Artiste an all inclusive fee of Rs.${_agreementModel.totalFee}. The Payment schedule as under:",
          ),
          pw.Bullet(
            text:
                "Rs.${_agreementModel.signingFee} on Signing of the agreement",
          ),
          pw.Bullet(
            text:
                "Rs.${_agreementModel.shootingFee} During Shooting (as per the progress of the film)",
          ),
          pw.Bullet(
            text:
                "Rs.${_agreementModel.postProductionFee} During Post Production (as per the progress of the film)",
          ),
          pw.Paragraph(
            text:
                "B) Producer shall pay to the Artiste/Techn. an all inclusive fees of Rs.${_agreementModel.perdayFee} per day(12 hours) & per day payment will be paid on everyday of Artist/Techn. is shooting for the film.",
          ),
          pw.Paragraph(
            text:
                "C) All the taxes applicable will be born by the Artiste/Techn. as in Income Tax, GST Tax, Professional Tax etc.",
          ),
          pw.Header(
            level: 1,
            text: "6. ARTISTE / TECHN.",
          ),
          pw.Bullet(
            text:
                "a) ARTISTE / TECHN. undertakes irrevocably to indemnify PRODUCER from all his/her past or current or future agreements or assignment if any, with any outside person/producer from any claim, of any kind whatsoever particularly in terms of money, fund or performance and hereafter, ARTISTE/TECH. is totally committed to this agreement in toto.",
          ),
          pw.Bullet(
            text:
                "The A/T irrevocably agrees to abide by the remuneration agreed herein and warrant and undertake that he shall not demand any increase in the remuneration come what may and the remuneration mentioned herein shall be full and final and shall not be open to any review, and the same shall be payable subject however, to the faithful performance of the agreed provisions herein contained by the A/T in its entirety.",
          ),
          pw.Bullet(
            text:
                "In case the said project is shelved because of unavoidable circumstances whatsover before the commencement of shooting, A/T undertakes to return signing amount  and  / or amount paid till date to producer within 15 days of the receipt of the producer's letters.",
          ),
          pw.Header(
            level: 1,
            text: "7. Arbitration",
          ),
          pw.Paragraph(
            text:
                "Any disputes or differences arising out of or pertaining to this Agreement shall first be resolved by the parties through negotiations, failing which such disputes/differences shall be referred to Arbitration in accordance with the provisions of the Indian Arbitrtion and Concillation Act, 1996, Such Arbitration proceedings shall be held in Mumbai. The Award passed by arbitrator's in pursuance of such Arbitration proceedings shall be binding upon parties hereto.",
          ),
          pw.Header(
            level: 1,
            text: "8. Jurisdiction",
          ),
          pw.Paragraph(
            text:
                "Any disputes/differences not being the subject matter of such Arbitration proceedings shall be subject to the exclusive jurisdiction of the courts of ${_agreementModel.place} only.",
          ),
          pw.Paragraph(
            text: "IN WITNESS WHEREOF",
          ),
          pw.Paragraph(
            text:
                "The Parties hereto have duly executed the Agreement as on the date, month and year as mentioned herein.",
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Text("Signed And Delivered by"),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(10.0),
                    child: pw.Text("____________"),
                  ),
                  pw.Text("Producer"),
                ],
              ),
              pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Text("Signed And Delivered by"),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(10.0),
                    child: pw.Text("____________"),
                  ),
                  pw.Text("Artiste/Technician"),
                ],
              )
            ],
          ),
          pw.Padding(
            padding: pw.EdgeInsets.only(top: 30.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text("Witness 1:_______"),
                pw.Text("Witness 2:_______"),
              ],
            ),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.only(top: 30.0),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Container(
                  height: 20.0,
                  width: 20.0,
                  child: pw.Image(logoImage),
                ),
                pw.Container(width: 5.0),
                pw.Text("Created using SHOW WORLD FILM DIRECTORY"),
              ],
            ),
          ),
        ];
      },
    ),
  );
  //Save pdf
  Directory _docdirectory = await getApplicationDocumentsDirectory();
  final String _documentpath = _docdirectory.path;
  print(
      'pdf stored at: $_documentpath/agreement_by_showworld_film_directory.pdf');
  File _pdffile =
      File('$_documentpath/agreement_by_showworld_film_directory.pdf');
  _pdffile.writeAsBytesSync(pdf.save());
  return "$_documentpath/agreement_by_showworld_film_directory.pdf";
}
