import 'robot.dart';
import 'spy_robot.dart';
import 'transport_robot.dart';

void main() {
  // Instance variables
  final robot = Robot(name: 'Tom', age: 5);
  final spyRobot = SpyRobot(name: 'Tom', age: 5);
  final lightTransportRobot = TransportRobot.light(name: 'Tim', age: 12);

  // Robot
  robot.speak(); // Should output: Hello, my name is Tom and my age is 5!

  // Spy Robot
  spyRobot.speak(); // Should output: Hello, my name is Tom and my age is 5! I am a spy robot!

  // Transport Robot
  lightTransportRobot.sayFavoriteJoke(); // Should output: My favorite joke is you!
}