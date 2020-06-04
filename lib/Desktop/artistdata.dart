import 'data_format.dart';

class ArtistData {
  List<DataTemplate> artistData = [
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
    return (artistData[0].name);
  }

  String printAddress() => artistData[0].address;
  String printPhoneNumber() => artistData[0].phoneNumber;
  String printEmail() => artistData[0].email;
}
