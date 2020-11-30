class Car {
  // properties
  var model, color, id, year, status;
  // Constructors
  Car(String Cmodel, String Ccolor, int Cid, int Cyear, String Cstatus) {
    this.model = Cmodel;
    this.color = Ccolor;
    this.id = Cid;
    this.year = Cyear;
    this.status = Cstatus;
  }

  // methods
  showinfo() {
    print('\n-----------------------------------');
    print('The Model of the car is :  ${model}');
    print('The Color of the car is :  ${color}');
    print('The Id of the car is :  ${id}');
    print('The Year of the car is :  ${year}');
    print('The Status of the car is :  ${status}');
  }
}
