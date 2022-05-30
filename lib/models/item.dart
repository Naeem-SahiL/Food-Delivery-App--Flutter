class Item{
  String? name;
  int? price;

  Item();

  Map<String, dynamic> toJson() => {'name': name, 'price': price}; 

  Item.fromSnapShot(snapshot):
      name = snapshot.data()['name'],
      price = snapshot.data()['price'];
}