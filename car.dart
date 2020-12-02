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
    // print('\n-----------------------------------');
    return 'ID: ${id}, Model: ${model}, color: ${color}, Year: ${year}, Status: ${status}';
  }
}
