class Product {
  dynamic id;
  dynamic shopId;
  dynamic categoryId;
  dynamic subCatId;
  String? productTitle;
  String? productDescription;
  String? productImage;
  dynamic productPrice;
  String? discount;
  dynamic quantity;
  dynamic uomId;
  String? inStock;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imagename;
  String? categoryName;
  String? storeName;
  String? uomName;

  Product({
    this.id,
    this.shopId,
    this.categoryId,
    this.subCatId,
    this.productTitle,
    this.productDescription,
    this.productImage,
    this.productPrice,
    this.discount,
    this.quantity,
    this.uomId,
    this.inStock,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.imagename,
    this.categoryName,
    this.storeName,
    this.uomName,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as dynamic,
        shopId: json['shop_id'] as dynamic,
        categoryId: json['category_id'] as dynamic,
        subCatId: json['sub_cat_id'] as dynamic,
        productTitle: json['product_title'] as String?,
        productDescription: json['product_Description'] as String?,
        productImage: json['product_image'] as String?,
        productPrice: json['product_price'] as dynamic,
        discount: json['discount'] as String?,
        quantity: json['quantity'] as dynamic,
        uomId: json['uom_id'] as dynamic,
        inStock: json['in_stock'] as String?,
        status: json['status'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        imagename: json['imagename'] as String?,
        categoryName: json['category_name'] as String?,
        storeName: json['store_name'] as String?,
        uomName: json['uom_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'shop_id': shopId,
        'category_id': categoryId,
        'sub_cat_id': subCatId,
        'product_title': productTitle,
        'product_Description': productDescription,
        'product_image': productImage,
        'product_price': productPrice,
        'discount': discount,
        'quantity': quantity,
        'uom_id': uomId,
        'in_stock': inStock,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'imagename': imagename,
        'category_name': categoryName,
        'store_name': storeName,
        'uom_name': uomName,
      };
}
