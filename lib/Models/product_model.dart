class products {
  String name;
  String description;
  String photoLink;
  String price;
  products({
    required this.name,
    required this.description,
    required this.price,
    required this.photoLink,
  });
  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "description": description,
  //       "photoLink": photoLink,
  //       "price": price,
  //     };
  products.fromFirebase(snapshot)
      : name = snapshot.data()["name"],
        description = snapshot.data()["description"],
        photoLink = snapshot.data()["photo link"],
        price = snapshot.data()["price"];
}
