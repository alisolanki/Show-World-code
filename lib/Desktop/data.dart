import 'data_format.dart';

class CategoryData {
  List<CategoryTemplate> categorydata = [
    CategoryTemplate(
      category: 'Artist',
      subcategory: ['Male Artists', 'Female Artists'],
    ),
    CategoryTemplate(
      category: 'Director',
      subcategory: ['Male Directors', 'Female Directors'],
    ),
  ];
}

class ArtistData {
  Map<String, List<DataTemplate>> artistData = {
    'Male Artists': [
      DataTemplate(
        name: 'Ali',
        category: 'Artist',
        subcategory: 'Male Artist',
        address: 'Andheri',
        phonenumber: '+91766382909202',
        email: 'alisolanki@gmail.com',
      ),
      DataTemplate(
        name: 'Manan',
        category: 'Artist',
        subcategory: 'Male Artist',
        address: 'Ghatkopar',
        phonenumber: '+91766382909202',
        email: 'manan@gmail.com',
      ),
      DataTemplate(
        name: 'Ali',
        category: 'Artist',
        subcategory: 'Male Artist',
        address: 'Andheri',
        phonenumber: '+91766382909202',
        email: 'alisolanki@gmail.com',
      ),
    ],
    'Female Artists': [
      DataTemplate(
        name: 'Nishita',
        category: 'Artist',
        subcategory: 'Female Artist',
        address: 'Thane',
        phonenumber: '+91766382909202',
        email: 'nishit@gmail.com',
      ),
    ],
  };
}

class DirectorData {
  Map<String, List<DataTemplate>> directorData = {
    'Male Directors': [
      DataTemplate(
        name: 'Ali',
        category: 'Artist',
        subcategory: 'Male Director',
        address: 'Andheri',
        phonenumber: '+91766382909202',
        email: 'alisolanki@gmail.com',
      ),
      DataTemplate(
        name: 'Manan',
        category: 'Artist',
        subcategory: 'Male Director',
        address: 'Ghatkopar',
        phonenumber: '+91766382909202',
        email: 'manan@gmail.com',
      ),
      DataTemplate(
        name: 'Ali',
        category: 'Artist',
        subcategory: 'Male Director',
        address: 'Andheri',
        phonenumber: '+91766382909202',
        email: 'alisolanki@gmail.com',
      ),
    ],
    'Female Directors': [
      DataTemplate(
        name: 'Nishita',
        category: 'Artist',
        subcategory: 'Female Director',
        address: 'Thane',
        phonenumber: '+91766382909202',
        email: 'nishit@gmail.com',
      ),
    ],
  };
}
