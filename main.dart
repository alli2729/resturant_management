import 'items/drink.dart';
import 'items/food.dart';
import 'resturant.dart';

void main(List<String> args) {
  // making resturant
  Resturant resturant = Resturant();

  //1
  //add item to menu
  resturant.addFood(
      food: Food(title: 'pizza', description: 'pepp', price: 200));
  resturant.addFood(
      food: Food(title: 'pasta', description: 'chicken', price: 150));
  resturant.addDrink(
      drink: Drink(title: 'pepsi', description: '300cc', price: 25));
  resturant.addDrink(
      drink: Drink(title: 'cocaCola', description: '300cc', price: 30));
  // removing item from menu
  resturant.deleteItem(itemTitle: 'cocaCola');
  // show menu
  resturant.showMenu();

  //2
  // add takeaway order
  resturant.addTakeaway(
    items: [
      Food(title: 'pizza', description: 'pepp', price: 200),
      Drink(title: 'pepsi', description: '300cc', price: 25),
      Drink(title: 'pepsi', description: '300cc', price: 25),
    ],
    dateAndTime: 'Friday 10pm',
  );
  // add item to order
  resturant.addItemToTakeaway(
    orderId: 1,
    items: [Food(title: 'pasta', description: 'chicken', price: 150)],
  );
  // remove an item from order
  resturant.deleteItemFromTakeaway(orderId: 1, itemTitle: 'pepsi');
  // changin status to finished
  resturant.finish(orderId: 1);
  // delete order
  resturant.deleteOrder(orderId: 1);
  // calculate total price
  print(resturant.totalPrice(orderId: 1));

  // show all orders
  resturant.showOrders();
}
