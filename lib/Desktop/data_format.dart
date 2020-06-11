class DataTemplate {
  String name, category, address, phonenumber, email; 
  DataTemplate({this.name, this.category, this.address, this.phonenumber, this.email});
}

class CategoryTemplate {
  String category;
  List<String> subcategory;
  CategoryTemplate({this.category, this.subcategory});
}
