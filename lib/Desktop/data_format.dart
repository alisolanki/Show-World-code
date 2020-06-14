class DataTemplate {
  String name, category, subcategory, address, phonenumber, email; 
  DataTemplate({this.name, this.category, this.subcategory, this.address, this.phonenumber, this.email});
}

class CategoryTemplate {
  String category;
  List<String> subcategory;
  CategoryTemplate({this.category, this.subcategory});
}
