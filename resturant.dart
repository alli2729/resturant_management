import 'items/drink.dart';
import 'items/food.dart';
import 'items/item.dart';
import 'orders/order.dart';
import 'orders/takeaway.dart';

class Resturant {
  // Variable
  List<Items> _menu = [];
  List<Order> _orders = [];

  // Methods
  // add a food to menu
  void addFood({required Food food}) => (menu.any((f) => f.title == food.title))
      ? print('${food.title} is already exist')
      : menu.add(food);

  // add a drink to menu
  void addDrink({required Drink drink}) =>
      (menu.any((d) => d.title == drink.title))
          ? print('${drink.title} is already exist')
          : menu.add(drink);

  // delete an item from menu
  void deleteItem({required String itemTitle}) {
    int index = menu.indexWhere((item) => item.title == itemTitle);
    menu.removeAt(index);
  }

  void showMenu() => print('menu : ${menu}');
  void showOrders() => print('orders : ${orders}');

  // delete an order from list
  void deleteOrder({required int orderId}) {
    if (orders[orderIndex(orderId: orderId)].isFinished) {
      print('cant delete finished order');
    } else {
      orders.removeAt(orderIndex(orderId: orderId));
    }
  }

  // add takeaway order
  void addTakeaway({required List<Items> items, required String dateAndTime}) {
    Takeaway t = Takeaway(dateAndTime: dateAndTime, itemsInOrder: items);
    t.itemsInOrder.addAll(items);
    orders.add(t);
  }

  // finilize the order
  void finish({required int orderId}) {
    orders[orderIndex(orderId: orderId)].isFinished = true;
  }

  // add item to takeaway order
  void addItemToTakeaway({required int orderId, required List<Items> items}) {
    if (!orders[orderIndex(orderId: orderId)].isFinished) {
      orders[orderIndex(orderId: orderId)].itemsInOrder.addAll(items);
    } else {
      print('cant change finished orders');
    }
  }

  // delete an item from takeaway order
  void deleteItemFromTakeaway(
      {required int orderId, required String itemTitle}) {
    // finding order from list
    Order o = orders[orderIndex(orderId: orderId)];
    // if oreder is not final
    if (!o.isFinished) {
      // finding item from order
      int index = o.itemsInOrder.indexWhere((item) => item.title == itemTitle);
      // remove that item
      o.itemsInOrder.removeAt(index);
    } else {
      print('cant change finished orders');
    }
  }

  // calculate total price of order
  double totalPrice({required int orderId}) {
    return orders[orderIndex(orderId: orderId)].totalPrice();
  }

  // get index of order
  int orderIndex({required int orderId}) =>
      orders.indexWhere((order) => order.id == orderId);

  // get order from list
  Order getOrder({required int orderId}) =>
      orders[orderIndex(orderId: orderId)];

  // Getter
  List<Items> get menu => _menu;
  List<Order> get orders => _orders;
}
