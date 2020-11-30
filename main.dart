import 'car.dart';

main() {
  var fleet = new Car("Toyota", "blue", 001, 2020, "available");
  var fleet2 = new Car("Honda", "Red", 006, 2018, "leased");

  fleet.showinfo();
  fleet2.showinfo();
}
