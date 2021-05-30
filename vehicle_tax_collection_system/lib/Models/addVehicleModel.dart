class AddVehicleModel {
  String ownerName;
  String vehicleregistrationDate;
  String vehicleNumber;
  String engineCapacity;
  String latestpaymentDate;

  AddVehicleModel(
      {this.ownerName,
        this.vehicleregistrationDate,
        this.vehicleNumber,
        this.engineCapacity,
        this.latestpaymentDate});

  AddVehicleModel.fromJson(Map<String, dynamic> json) {
    ownerName = json['ownerName'];
    vehicleregistrationDate = json['registrationDate'];
    vehicleNumber = json['vehicleNumber'];
    engineCapacity = json['engineCapacity'];
    latestpaymentDate = json['paymentDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ownerName'] = this.ownerName;
    data['registrationDate'] = this.vehicleregistrationDate;
    data['vehicleNumber'] = this.vehicleNumber;
    data['engineCapacity'] = this.engineCapacity;
    data['paymentDate'] = this.latestpaymentDate;
    return data;
  }
}