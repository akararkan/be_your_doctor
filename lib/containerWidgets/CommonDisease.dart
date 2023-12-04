import 'package:flutter/material.dart';

class CommmonDisease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Disease Information'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Other content of your main page
          YourCustomWidget(),
          SizedBox(height: 20),
          DiseaseCard('Cancer',
              'Cancer is a group of diseases characterized by the uncontrolled growth and spread of abnormal cells. There are many types of cancer, each with its own set of symptoms, diagnostic methods, and treatment options.'),
          DiseaseCard('Influenza',
              'Influenza, commonly known as the flu, is a viral respiratory infection. It is highly contagious and can lead to mild to severe illness, and in some cases, it can be fatal.'),
          DiseaseCard('Semester sickness',
              'Semester sickness" is not a specific medical term, and the term might refer to various health issues that students commonly face during stressful academic periods.'),
          DiseaseCard('Orthopedics',
              'Orthopedics is a medical specialty focused on the musculoskeletal system, including bones, joints, muscles, ligaments, and tendons.'),
        ],
      ),
    );
  }
}

class YourCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Add a subtle shadow
      margin: EdgeInsets.all(16),
      color: Colors.blue, // Set a background color
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            'See The Common Diseases Here',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white, // Set text color
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class DiseaseCard extends StatelessWidget {
  final String diseaseName;
  final String diseaseDetails;

  DiseaseCard(this.diseaseName, this.diseaseDetails);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DiseaseDetailsPage(
                diseaseName: diseaseName,
                diseaseDetails: diseaseDetails,
              ),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              diseaseName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class DiseaseDetailsPage extends StatelessWidget {
  final String diseaseName;
  final String diseaseDetails;

  DiseaseDetailsPage({required this.diseaseName, required this.diseaseDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(diseaseName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details about $diseaseName:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              diseaseDetails,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
