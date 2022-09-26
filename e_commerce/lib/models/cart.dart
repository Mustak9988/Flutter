import 'package:e_commerce/models/catalog.dart';

class CartModel {
  //singleton becuse of creating object single time otherwise always new object create
  static final cartModel = CartModel._singleton();
  CartModel._singleton();
  factory CartModel() => cartModel;

  late CatalogModel _catalog;

  final List<int> _itemId = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel catalogModel) {
    assert(catalogModel != null);
    _catalog = catalogModel;
  }

// Get items in the cart
  List<Item> get items => _itemId.map((id) => _catalog.getById(id)).toList();

  // Get total price
  double? get totalPrices =>
      items.fold(0, (total, current) => total! + current.price!.toDouble());

//upTotal price and Total price both are same method
  // num? totalPrice(Item item) {
  //   num? sum = 0.0;
  //     sum = sum + item.price!.ceilToDouble();
  //   return sum;
  // }

  // Add Item

  void add(Item item) {
    _itemId.add(item.id!.toInt());
  }

  // Remove Item

  void remove(Item item) {
    _itemId.remove(item.id!.toInt());
  }
}
