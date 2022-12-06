// // To parse this JSON data, do
// //
// //     final product = productFromMap(jsonString);

// import 'dart:convert';

// Product productFromMap(String str) => Product.fromJson(json.decode(str));

// String productToMap(Product data) => json.encode(data.toMap());

// class Product {
//   Product({
//     this.id = 0,
//     this.shopId,
//     this.categoryId,
//     this.subCatId,
//     this.productTitle,
//     this.productDescription,
//     this.productImage,
//     this.productPrice,
//     this.discount,
//     this.quantity,
//     this.uomId,
//     this.inStock,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.imagename,
//     this.storeName,
//     this.uomName,
//   });

//   int id;
//   String? shopId;
//   String? categoryId;
//   String? subCatId;
//   String? productTitle;
//   String? productDescription;
//   String? productImage;
//   String? productPrice;
//   String? discount;
//   String? quantity;
//   String? uomId;
//   String? inStock;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? imagename;
//   String? storeName;
//   String? uomName;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         shopId: json["shop_id"],
//         categoryId: json["category_id"],
//         subCatId: json["sub_cat_id"],
//         productTitle: json["product_title"],
//         productDescription: json["product_Description"],
//         productImage: json["product_image"],
//         productPrice: json["product_price"],
//         discount: json["discount"],
//         quantity: json["quantity"],
//         uomId: json["uom_id"],
//         inStock: json["in_stock"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         imagename: json["imagename"],
//         storeName: json["store_name"],
//         uomName: json["uom_name"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "shop_id": shopId,
//         "category_id": categoryId,
//         "sub_cat_id": subCatId,
//         "product_title": productTitle,
//         "product_Description": productDescription,
//         "product_image": productImage,
//         "product_price": productPrice,
//         "discount": discount,
//         "quantity": quantity,
//         "uom_id": uomId,
//         "in_stock": inStock,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "imagename": imagename,
//         "store_name": storeName,
//         "uom_name": uomName,
//       };
// }
