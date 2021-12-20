import 'package:equatable/equatable.dart';
import 'package:fluuter_airplane/models/destination_model.dart';

class TransactionModel extends Equatable {
  final DestinationModel destination;
  final int amountOfTraveler, price, grandTotal;
  final String selectedSeats, id;
  final bool insurance, refundable;
  final double vat;

  TransactionModel({
    required this.destination,
    this.amountOfTraveler = 0,
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
    this.id = '',
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) => TransactionModel(
        id: id,
        destination: DestinationModel.fromJson(
          json['destination']['id'],
          json['destination'],
        ),
        amountOfTraveler: json['amountOfTraveler'],
        selectedSeats: json['selectedSeats'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );

  @override
  List<Object?> get props => [
        destination,
        amountOfTraveler,
        price,
        grandTotal,
        selectedSeats,
        insurance,
        refundable,
        vat,
      ];
}
