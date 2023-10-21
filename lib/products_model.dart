class ProductModel {
  final int pid;
  final String imgurl;
  final String title;
  final String Shortdescription;
  final String price;
  final String longdescription;
  final double rating;
  bool isselected;
  int qty;
  ProductModel({
    required this.pid,
    required this.imgurl,
    required this.title,
    required this.Shortdescription,
    required this.longdescription,
    required this.price,
    required this.rating,
     this.isselected = false,
     this.qty = 1, required shortdescription,
  });

  get shortdescription => null;
  ProductModel copyWith({
    int? pid,
    String? imgurl,
    String? title,
    String? shortDescription,
    String? price,
    String? longDescription,
    double? rating,
    bool? isExpanded,
    int? qty,
  }) {
    return ProductModel(
      pid: pid ?? this.pid,
      imgurl: imgurl ?? this.imgurl,
      title: title ?? this.title,
      shortdescription: shortDescription ?? this.shortdescription,
      price: price ?? this.price,
      longdescription: longDescription ?? this.longdescription,
      rating: rating ?? this.rating,
      isselected: isExpanded ?? this.isselected,
      qty: qty ?? this.qty, Shortdescription: '',
    );
  }
}
