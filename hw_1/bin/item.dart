enum ItemWeight {light, normal, heavy}

class Item {
  // Constructor
  Item({required this.name, required this.weight, this.description}); // description is optional

  //Instance variables
  final String? name;
  final ItemWeight? weight;
  final String? description;
}

void main() {
  // Create items.
  final lightItem = Item(name: 'Hat', weight: ItemWeight.light, description: 'You can wear this!');
  final lightItemTwo = Item(name: 'Pen', weight: ItemWeight.light);
  final normalItem = Item(name: 'Suitcase', weight: ItemWeight.normal);
  final heavyItem = Item(name: 'Car', weight: ItemWeight.heavy);

  // Print instance variable values which cannot be changed after assignment.
  print(lightItem.name); // Should output: Hat
  print(lightItem.description); // Should output: You can wear this!
  print(lightItem.weight); // Should output: ItemWeight.light
}