import 'dart:core';
import 'car.dart';
import 'dart:io';

List<Car> fleet = [];

main() {
  // var fleet = new Car("Toyota", "blue", 001, 2020, "available");
  // var fleet2 = new Car("Honda", "Red", 006, 2018, "leased");
  print('Welcome to Makinde\'s Fleet');
  print('---------------------------\n');
  options();
}

options() {
  stdout.writeln('\nChoose from the options listed below:');
  stdout.writeln('1) Add car to fleet');
  stdout.writeln('2) View cars leased out');
  stdout.writeln('3) View cars available');
  stdout.writeln('4) View car properties');
  stdout.writeln('5) Remove car');
  String option = stdin.readLineSync();

  switch (option) {
    case '1':
      add();
      break;
    case '2':
      leased();
      break;
    case '3':
      available();
      break;
    case '4':
      properties();
      break;
    case '5':
      removed();
      break;
    default:
  }
  options();
}

add() {
  stdout.writeln('\nAdd car to fleet');

  stdout.writeln('Enter car model: ');
  String model = stdin.readLineSync();

  stdout.writeln('Enter car year: ');
  int year = int.parse(stdin.readLineSync());

  stdout.writeln('Enter car color: ');
  String color = stdin.readLineSync();

  stdout.writeln('Enter car status: ');
  String status = stdin.readLineSync();

  DateTime today = new DateTime.now();
  int id = int.parse(
      "${today.year.toString()}${today.month.toString().padLeft(2, '0')}${today.day.toString().padLeft(2, '0')}${today.hour.toString()}${today.minute.toString()}${today.second.toString()}");

  var car = new Car(model, color, id, year, status);
  fleet.add(car);
  print('Car with model ${model} was added to fleet successfully');
}

leased() {
  stdout.writeln('\nView cars leased out');
}

available() {
  stdout.writeln('\nView cars available');
}

properties() {
  stdout.writeln('\nView cars properties');
  fleet.forEach((car) {
    car.showinfo();
  });
}

removed() {
  stdout.writeln('\nRemove car');
  stdout.writeln('Enter car name to remove: ');
  String remove = stdin.readLineSync();
  print('Car to remove is ${remove}');
}
// ...
