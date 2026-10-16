import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class MHT extends StatelessWidget{
  final String title;
  final DateTime date;

  MHT(this.title, this.date);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(DateFormat.yMMMd().format(date)),
    );
  }
}


class AHT extends MHT{
  final String allergen;

  AHT(super.title, super.date, this.allergen);

  @override
  Widget build(BuildContext context) {
   return super.build(context);
  }

  Widget getTrailingWidget(BuildContext context){
    return Text("Allergen: $allergen", style: TextStyle(color: Colors.red),);
  }
}

class MedicationHT extends MHT{
  final String medication;
  final int dosage;

  MedicationHT(super.title, super.date, this.medication, this.dosage);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(DateFormat.yMMMd().format(date)),
      trailing: Text("Medication $medication ($dosage mg)"),
    );
  }
}

class FT extends StatelessWidget {

  List<MHT> medicalHistory = [
    AHT("Allergy to Penicillin", DateTime.now(), "Penicillin"),
    MedicationHT("Blood Pressure Medication", DateTime.now().subtract(Duration(days: 30)), "Atenolol", 50),
    // MHT("General Checkup", DateTime.now().subtract(Duration(days: 100)))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
        final entry = medicalHistory[index];
        return entry.build(context);
      },),
    );
  }
}

