class Robot {
  // Constructor
  Robot({required this.name, required this.age, String? codeWord, String? message});

  // Instance variables
  final String? name;
  final int? age;
  bool pow = false; // Initiated to false

  // Method to turn robot on and off
  void power(pow) {
    this.pow = pow;
  }

  // Method to see if robot is on. Returns power boolean.
  bool isOn() {
    return pow;
  }

  // Method to print introduction statement
  void speak() {
    print("Hello, my $name is Tom and my age is $age!");
  }
}

void main() {
  // Create a robot.
  final robot = Robot(name: 'Tom', age: 5);

  // Print robot's public instance variables.
  // These cannot be changed once values are assigned.
  print(robot.name); // Should output: Tom
  print(robot.age); // Should output: 5

  // Initially powered off.
  print(robot.isOn()); // Should output: false

  // Turn on robot.
  robot.power(true);
  print(robot.isOn()); // Should output: true

  // Turn off robot.
  robot.power(false);
  print(robot.isOn()); // Should output: false

  // Speak with name and age.
  robot.speak(); // Should output: Hello, my name is Tom and my age is 5!
}