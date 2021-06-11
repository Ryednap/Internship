
// Proudct Data class with properties

class ProductData {
  String? name;
  String? shortDesc;
  String? longDesc;
  double? price;
  double? discount;
  dynamic image;

  ProductData(String? name, String? shortDesc, 
    String? longDesc, double? price, double? discount, dynamic image
    ) {

      this.name = name;
      this.shortDesc = shortDesc;
      this.longDesc = longDesc;
      this.price = price;
      this.discount = discount;
      this.image = image;
  }

// @getters

  String? getName() {
    return this.name;
  }

  String? getshortDesc() {
    return this.shortDesc;
  }

  String? getlongDesc() {
    return this.longDesc;
  }
  double? getPrice() {
    return this.price;
  }
  double? getDiscount() {
    return this.discount;
  }

  double? getNewPrice() {
    return (this.price! * (1 - this.discount! / 100.0)).roundToDouble();
  }

  dynamic getImage() {
    return this.image;
  }

}