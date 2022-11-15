import 'robot.dart';
import 'item.dart';
import 'robot_addons.dart';

class TransportRobot extends Robot implements JokingRobot, SingingRobot {
  // Constructor
  TransportRobot({required String name, required int age, this.weight}) : super(name: name, age: age);

  //Named Constructor
  TransportRobot.weight({ItemWeight? weightParam, String? name, int? age}) : weight = weightParam, super(name: name, age: age);
  TransportRobot.light({required String? name, required int? age}) : weight = ItemWeight.light, super(name: name, age: age);
  TransportRobot.normal({required String? name, required int? age}) : weight = ItemWeight.normal, super(name: name, age: age);
  TransportRobot.heavy({required String? name, required int? age}) : weight = ItemWeight.heavy, super(name: name, age: age);

  // Instance Variables
  final ItemWeight? weight;
  var items = <Item>[];

  // Method for checking when picking up an item, the Item must have same weight type as robot.
  bool pickUp(Item item) {
    if (weight == item.weight) { // If has same weight type, pickUp will return true.
      items.add(item);
      return true;
    } else { // If does not have same weight type, pickup will return false.
      return false;
    }
  }

  // Method for returning item with name.
  Item? getItemWithName(String name) {
    if (items.length == 0) {
      return null;
    }


    for (int i = 0; i < items.length; i++) {
      if (name == items[i].name) {
        return items[i];
      }
    }

    // throw '';
  }

  // Method for removing item.
  bool remove(String name) {
    if (items.length == 0) {
      return false;
    }

    for (int i = 0; i < items.length; i++) {
      if (items[i].name == name) { // Remove item if it exists
        items.removeAt(i);
        return true;
      }
    }

    return false;

    // throw '';
  }

  // Abstract Class Joking Robot from robot_addons.dart
  @override
  void sayFavoriteJoke() {
    print("My favorite joke is you!");
  }

  // Abstract Class Singing Robot from robot_addons.dart
  @override
  void singFavoriteSong() {
    print("La da dee da da da!");
  }
}

void main() {
  // Create items.
  final lightItem = Item(name: 'Hat', weight: ItemWeight.light, description: 'You can wear this!');
  final lightItemTwo = Item(name: 'Pen', weight: ItemWeight.light);
  final normalItem = Item(name: 'Suitcase', weight: ItemWeight.normal);
  final heavyItem = Item(name: 'Car', weight: ItemWeight.heavy);

  // Create different types of transport robots.
  final lightTransportRobot = TransportRobot.light(name: 'Tim', age: 12);
  final normalTransportRobot = TransportRobot.normal(name: 'Jan', age: 5);
  final heavyTransportRobot = TransportRobot.heavy(name: 'Ralph', age: 10);

  // Check weight after creation to make sure it matches.
  print(lightTransportRobot.weight == ItemWeight.light); // Should output: true
  print(normalTransportRobot.weight == ItemWeight.normal); // Should output: true
  print(heavyTransportRobot.weight == ItemWeight.heavy); // Should output: true

  // When picking up an item, the Item must have same weight type as robot.
  // If has same weight type, pickUp will return true.
  // If does not have same weight type, pickup will return false.
  print(lightTransportRobot.items.isEmpty); // Should output: true
  print(lightTransportRobot.pickUp(lightItem)); // Should output: true
  print(lightTransportRobot.pickUp(lightItemTwo)); // Should output: true
  print(lightTransportRobot.pickUp(normalItem)); // Should output: false
  print(lightTransportRobot.pickUp(heavyItem)); // Should output: false
  print(lightTransportRobot.items[0].name); // Should output: Hat
  print(lightTransportRobot.items[1].name); // Should output: Pen

  // Check if TransportRobot is Robot.
  print(lightTransportRobot is Robot); // Should output: true.

  // Return item with name.
  print(lightTransportRobot.getItemWithName('Hat')?.name ?? 'No item'); // Should output: Hat
  print(lightTransportRobot.getItemWithName('key')?.name ?? 'No item'); // Should output: No item

  // Remove item.
  print(lightTransportRobot.remove('Hat')); // Should output: true
  print(lightTransportRobot.remove('Hat')); // Should output: false

  // Check if TransportRobot is JokingRobot and SingingRobot.
  print(lightTransportRobot is JokingRobot); // Should output: true.
  print(lightTransportRobot is SingingRobot); // Should output: true.

  // Should output correctly.
  lightTransportRobot.sayFavoriteJoke(); // Should output: My favorite joke is you!
  lightTransportRobot.singFavoriteSong(); // Should output: La da dee da da da!
}