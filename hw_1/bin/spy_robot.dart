import 'robot.dart';

class SpyRobot extends Robot {
  // Constructor
  SpyRobot({required String name, required int age, this.codeWord, this.message}) : super(name: name, age: age);

  // Named Constructor
  // SpyRobot.saveSecret(this.codeWord, this.message, [String? name, int? age]) : super(codeWord: codeWord, message: message, name: name, age: age);
  SpyRobot.saveSecret({required String codeWordParam, required String messageParam, String? name, int? age}) : codeWord = codeWordParam, message = messageParam, super(name: name, age: age);

  //Instance variables
  final String? codeWord;
  final String? message;
  var codes = <String>[];
  var secrets = <String>[];

  // Override method to print spy robot introduction statement
  @override
  void speak() {
    print("Hello, my $name is Tom and my age is $age! I am a spy robot!");
  }

  // Method to save secret
  bool saveSecret({required String codeWord, required String message, String? name, int? age}) {
    if (codes.length == 0) {
      codes.add(codeWord);
      secrets.add(message);
      return true;
    }

    for (int i = 0; i < codes.length; i++) {
      if (codes[i] != codeWord) { // If secret does not exist with codeWord, it will return true + save the code word and message;
        codes.add(codeWord);
        secrets.add(message);
        return true;
      }
      else { // If secret does exist with codeWord, it will return false.
        return false;
      }
    }

    throw '';
  }

  // Method to see if code word has a secret
  bool hasSecret(codeWord) {
    if (codes.length == 0) {
      return false;
    }

    for (int i = 0; i < codes.length; i++) {
      if (codes[i] != codeWord) { // If secret does not exist with codeWord, it will return false.
        return false;
      }
      else { // If secret does exist with codeWord, it will return true.
        return true;
      }
    }

    throw '';
  }

  // Method to remove secret
  bool removeSecret(codeWord) {
    if (codes.length == 0) {
      return false;
    }

    for (int i = 0; i < codes.length; i++) {
      if (codes[i] != codeWord) { // If secret does not exist with codeWord, it will return false.
        return false;
      }
      else { // If secret does exist with codeWord, it will return true + remove secret and corresponding code word.
        codes.removeAt(i);
        secrets.removeAt(i);
        return true;
      }
    }

    throw '';
  }

  // Method to print all secrets
  void sayAllSecrets() {
    if (codes.length == 0) {   // If there are no secrets, it should output: I don't have any secrets to say.
      print("I don't have any secrets to say.");
    }
    else {
      for (int i = 0; i < codes.length; i++) {   // If there are secrets, it should output all secrets at once.
        print("The secret for ${codes[i]} is ${secrets[i]}");
      }
    }
  }
}

void main() {
  // Create a spy robot.
  final spyRobot = SpyRobot(name: 'Tom', age: 5);

  // Check if SpyRobot is Robot.
    print(spyRobot is Robot); // Should output: true.

  // Print spy robot's public properties.
    print(spyRobot.name); // Should output: Tom
    print(spyRobot.age); // Should output: 5

  // Speak with name and age.
    spyRobot.speak(); // Should output: Hello, my name is Tom and my age is 5! I am a spy robot!

  // Save a new secret.
  // If secret does not exist with codeWord, it will return true.
  // If secret does exist with codeWord, it will return false.
    print(spyRobot.saveSecret(codeWord: 'zulu', message: 'This is my old message!')); // Should output: true

  // Try to save a secret with the same codeWord.
    print(spyRobot.saveSecret(codeWord: 'zulu', message: 'This is my new message!')); // Should output: false

  // Should have secret using codeWord.
  // If secret does not exist with codeWord, it will return false.
  // If secret does exist with codeWord, it will return true.
    print(spyRobot.hasSecret('zulu')); // Should output: true
    print(spyRobot.hasSecret('kilo')); // Should output: false

  // Remove secret that exists.
  // If secret does not exist with codeWord, it will return false.
  // If secret does exist with codeWord, it will return true.
    print(spyRobot.removeSecret('zulu')); // Should output: true

  // Remove secret that does not exist.
    print(spyRobot.removeSecret('zulu')); // Should output: false

  // Say all secrets.
  // If there are no secrets, it should output: I don't have any secrets to say.
  // If there are secrets, it should output all secrets at once.
    spyRobot.sayAllSecrets();

  // Should output:
  // I don't have any secrets to say.

  // Save secrets.
  print(spyRobot.saveSecret(codeWord: 'zulu', message: 'This is my old message!')); // Should output: true
  print(spyRobot.saveSecret(codeWord: 'kilo', message: 'Hello there!')); // Should output: true
  print(spyRobot.saveSecret(codeWord: 'foxtrot', message: 'Bye bye!')); // Should output: true

  // Say all secrets.
    spyRobot.sayAllSecrets();

  // Should output:
  // The secret for zulu is This is my old message!
  // The secret for kilo is Hello there!
  // The secret for foxtrot is Bye bye!
}