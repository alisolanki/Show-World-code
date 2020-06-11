import 'data_format.dart';

class ArtistData {
  List<DataTemplate> artistData = [
    DataTemplate(
      name: 'Ali',
      category: 'Artist',
      address: 'Andheri',
      phonenumber: '+91766382909202',
      email: 'alisolanki@gmail.com',
    ),
    DataTemplate(
      name: 'Manan',
      category: 'Artist',
      address: 'Ghatkopar',
      phonenumber: '+91766382909202',
      email: 'manan@gmail.com',
    ),
    DataTemplate(
      name: 'Nishit',
      category: 'Artist',
      address: 'Thane',
      phonenumber: '+91766382909202',
      email: 'nishit@gmail.com',
    ),
    DataTemplate(
      name: 'Ali',
      category: 'Artist',
      address: 'Andheri',
      phonenumber: '+91766382909202',
      email: 'alisolanki@gmail.com',
    ),
  ];
  String printDataName() {
    return (artistData[0].name);
  }

  String printAddress() => artistData[0].address;
  String printPhoneNumber() => artistData[0].phonenumber;
  String printEmail() => artistData[0].email;
}

class DirectorData {
  List<DataTemplate> directorData = [
    DataTemplate(
      name: 'Ali',
      category: 'Director',
      address: 'Andheri',
      phonenumber: '+91766382909202',
      email: 'alisolanki@gmail.com',
    ),
    DataTemplate(
      name: 'Manan',
      category: 'Director',
      address: 'Ghatkopar',
      phonenumber: '+91766382909202',
      email: 'manan@gmail.com',
    ),
    DataTemplate(
      name: 'Nishit',
      category: 'Director',
      address: 'Thane',
      phonenumber: '+91766382909202',
      email: 'nishit@gmail.com',
    ),
    DataTemplate(
      name: 'Ali',
      category: 'Director',
      address: 'Andheri',
      phonenumber: '+91766382909202',
      email: 'alisolanki@gmail.com',
    ),
  ];
}
