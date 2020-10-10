import 'package:flutter/material.dart';

class FilmRevenuePage extends StatefulWidget {
  @override
  _FilmRevenuePageState createState() => _FilmRevenuePageState();
}

class _FilmRevenuePageState extends State<FilmRevenuePage> {
  bool _allIndiaTheatre = false;
  bool _doordarshan = false;
  bool _inFilmAdvt = false;
  bool _cableTVRights = false;
  bool _digitalNetworking = false;
  bool _musicRingtone = false;
  bool _dubbingRights = false;
  bool _negativeRights = false;
  bool _overseas = false;
  bool _satellite = false;
  bool _remakeRights = false;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffd4e6f1),
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
              letterSpacing: 1.5,
              fontSize: 25,
              color: Color(0xff1b4f72),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff1b4f72),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shadowColor: Colors.blue[300],
              elevation: 1,
              color: const Color(0xdd1a5276),
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 8.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "roboto",
                      fontSize: _width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.monetization_on,
                          size: _width * 0.045,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "  Generate Film Revenue",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              "You can generate your Film Revenue from these sources:",
              style: const TextStyle(
                fontFamily: 'roboto',
                color: Colors.black87,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            _tiles("All India Theatrical Rights", _allIndiaTheatre),
            _tiles("Doordarshan", _doordarshan),
            _tiles("InFilm Advertisement", _inFilmAdvt),
            _tiles("Cable TV Rights", _cableTVRights),
            _tiles("Digital Networking", _digitalNetworking),
            _tiles("Music/Ringtone", _musicRingtone),
            _tiles("Dubbing Rights", _dubbingRights),
            _tiles("Negative Rights", _negativeRights),
            _tiles("Overseas", _overseas),
            _tiles("Satellite", _satellite),
            _tiles("Remake Rights", _remakeRights),
            SizedBox(
              height: 70.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _tiles(String name, bool check) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "$name",
            style: const TextStyle(
              fontFamily: "roboto",
              fontWeight: FontWeight.bold,
              color: const Color(0xff5499c7),
            ),
          ),
        ),
        trailing: check
            ? const Icon(
                Icons.check_box,
                color: const Color(0xff5499c7),
              )
            : const Icon(
                Icons.check_box_outline_blank,
                color: const Color(0xff5499c7),
              ),
        dense: true,
        onTap: () => setState(() {
          switch (name) {
            case "All India Theatrical Rights":
              {
                _allIndiaTheatre = !_allIndiaTheatre;
                break;
              }
            case "Doordarshan":
              {
                _doordarshan = !_doordarshan;
                break;
              }
            case "InFilm Advertisement":
              {
                _inFilmAdvt = !_inFilmAdvt;
                break;
              }
            case "Cable TV Rights":
              {
                _cableTVRights = !_cableTVRights;
                break;
              }
            case "Digital Networking":
              {
                _digitalNetworking = !_digitalNetworking;
                break;
              }
            case "Music/Ringtone":
              {
                _musicRingtone = !_musicRingtone;
                break;
              }
            case "Dubbing Rights":
              {
                _dubbingRights = !_dubbingRights;
                break;
              }
            case "Negative Rights":
              {
                _negativeRights = !_negativeRights;
                break;
              }
            case "Overseas":
              {
                _overseas = !_overseas;
                break;
              }
            case "Satellite":
              {
                _satellite = !_satellite;
                break;
              }
            case "Remake Rights":
              {
                _remakeRights = !_remakeRights;
                break;
              }
            default:
              {
                break;
              }
          }
        }),
      ),
    );
  }
}
