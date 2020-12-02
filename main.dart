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
  stdout.writeln('1) Add fleet to garage');
  stdout.writeln('2) View fleets leased out');
  stdout.writeln('3) View fleets available');
  stdout.writeln('4) View fleets properties');
  stdout.writeln('5) Lease fleet if available');
  stdout.writeln('6) returned lease fleets');
  stdout.writeln('7) Remove fleet');
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
      availableForLease();
      break;
    case '6':
      returned();
      break;
    case '7':
      removed();
      break;
    default:
      break;
  }
  // recursive loop
  options();
}

add() {
  stdout.writeln('\nAdd fleet to garage');

  stdout.writeln('Enter fleet model: ');
  String model = stdin.readLineSync();

  stdout.writeln('Enter fleet year: ');
  int year = int.parse(stdin.readLineSync());

  stdout.writeln('Enter fleet color: ');
  String color = stdin.readLineSync();

  stdout.writeln('Select fleet Status:');
  stdout.writeln('1) Available 2) Leased');
  String status = stdin.readLineSync();
  if (status == '1')
    status = 'Available';
  else
    status = 'Leased';

  DateTime today = new DateTime.now();
  int id = int.parse(
      "${today.year.toString()}${today.month.toString().padLeft(2, '0')}${today.day.toString().padLeft(2, '0')}${today.hour.toString()}${today.minute.toString()}${today.second.toString()}");

  var car = new Car(model, color, id, year, status);
  fleet.add(car);
  print('Car with model ${model} was added to fleet successfully');
}

leased() {
  stdout.writeln('\nView fleets leased out');
  fleet.forEach((car) {
    if (car.status == 'Leased') {
      print(car.showinfo());
    }
  });
}

available() {
  stdout.writeln('\nView fleets available');
  fleet.forEach((car) {
    if (car.status == 'Available') {
      print(car.showinfo());
    }
  });
}

properties() {
  stdout.writeln('\nView fleets properties');
  int count = 1;
  fleet.forEach((car) {
    print("${count} ${car.showinfo()}");
    count++;
  });
}

availableForLease() {
  stdout.writeln('\nLease fleet if available');
  fleet.forEach((car) {
    if (car.status == 'Available') {
      print(car.showinfo());
    }
  });
  var found = false;
  stdout.writeln('\nEnter the fleet id available for lease');
  int id = int.parse(stdin.readLineSync());
  fleet.forEach((car) {
    if (car.id == id && car.status == 'Available') {
      car.status = 'Leased';
      print('Fleet ${car.model} is leased.');
      found = true;
    }
  });
  if (!found) print('fleet with ID ${id} is not leased.');
}

returned() {
  stdout.writeln('\nReturned lease fleet');
  fleet.forEach((car) {
    if (car.status == 'Leased') {
      print(car.showinfo());
    }
  });
  stdout.writeln('\nEnter the fleet id returned');
  int id = int.parse(stdin.readLineSync());
  fleet.forEach((car) {
    if (car.id == id) {
      car.status = 'Available';
      print('Fleet ${car.model} is available');
    }
  });
}

removed() {
  stdout.writeln('\nRemove fleet');
  fleet.forEach((car) {
    if (car.status == 'Available') {
      print(car.showinfo());
    }
  });
  stdout.writeln('\nEnter the fleet id to remove');
  int id = int.parse(stdin.readLineSync());
  fleet.removeWhere((car) => car.id == id);
  print('fleet with ID ${id} is removed');
}
// ...
