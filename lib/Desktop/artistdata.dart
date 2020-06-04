import 'data_format.dart';

class ArtistData {
<<<<<<< HEAD
  List<DataTemplate> artistData = [
=======
  List<DataTemplate> _artistData = [
>>>>>>> ce3c729f28a791e2d2cded8510e4f2ac2a6b3948
    DataTemplate(
      name: 'Ali',
      address: 'Andheri',
      phoneNumber: '+91766382909202',
      email: 'alisolanki@gmail.com',
    ),
    DataTemplate(
      name: 'Manan',
      address: 'Ghatkopar',
      phoneNumber: '+91766382909202',
      email: 'manan@gmail.com',
    ),
    DataTemplate(
      name: 'Nishit',
      address: 'Thane',
      phoneNumber: '+91766382909202',
      email: 'nishit@gmail.com',
    ),
    DataTemplate(
      name: 'Ali',
      address: 'Andheri',
      phoneNumber: '+91766382909202',
      email: 'alisolanki@gmail.com',
    ),
  ];
  String printDataName() {
<<<<<<< HEAD
    return (artistData[0].name);
  }

  String printAddress() => artistData[0].address;
  String printPhoneNumber() => artistData[0].phoneNumber;
  String printEmail() => artistData[0].email;
=======
    return (_artistData[0].name);
  }

  String printAddress() => _artistData[0].address;
  String printPhoneNumber() => _artistData[0].phoneNumber;
  String printEmail() => _artistData[0].email;
>>>>>>> ce3c729f28a791e2d2cded8510e4f2ac2a6b3948
}
