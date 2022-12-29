import 'dart:io';

class CreateOfProductModel {
  final String name;
  final String category_id;
  final File image;
  final String stock;
  final String deskripsi;
  final String harga;

  CreateOfProductModel(
      {required this.category_id,
      required this.image,
      required this.name,
      required this.stock,
      required this.harga,
      required this.deskripsi});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": category_id,
        "handphone": stock,
        "password": deskripsi,
        "password_confirmation": image,
        "harga": harga,
        "image": image
      };
}
