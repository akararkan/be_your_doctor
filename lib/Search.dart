import 'package:flutter/material.dart';

class Disease {
  final String name;
  final String treatment;

  Disease({required this.name, required this.treatment});
}

class SearchPage extends StatefulWidget {
  @override
  _DiseaseSearchTabState createState() => _DiseaseSearchTabState();
}

class _DiseaseSearchTabState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Disease> _allDiseases = [
    Disease(name: 'Flu', treatment: 'Rest and fluids'),
    Disease(name: 'Common Cold', treatment: 'Rest and stay hydrated'),
    Disease(name: 'COVID-19', treatment: 'Follow medical advice'),
    Disease(name: 'Migraine', treatment: 'Pain relievers and rest'),
    Disease(name: 'Diabetes', treatment: 'Insulin and lifestyle changes'),
    Disease(name: 'Hypertension', treatment: 'Medications and healthy lifestyle'),
    Disease(name: 'Asthma', treatment: 'Bronchodilators and anti-inflammatory drugs'),
    Disease(name: 'Arthritis', treatment: 'Pain relievers and physical therapy'),
    Disease(name: 'Alzheimer\'s', treatment: 'Medications and support'),
    Disease(name: 'Osteoporosis', treatment: 'Calcium and vitamin D supplements'),
    Disease(name: 'Cancer', treatment: 'Chemotherapy and radiation therapy'),
    Disease(name: 'Epilepsy', treatment: 'Antiseizure medications'),
    Disease(name: 'Chronic Kidney Disease', treatment: 'Dialysis and medication'),
    Disease(name: 'Parkinson\'s Disease', treatment: 'Medications and physical therapy'),
    Disease(name: 'Rheumatoid Arthritis', treatment: 'Disease-modifying antirheumatic drugs'),
    Disease(name: 'Psoriasis', treatment: 'Topical treatments and medications'),
    Disease(name: 'Celiac Disease', treatment: 'Gluten-free diet'),
    Disease(name: 'Gout', treatment: 'Medications and lifestyle changes'),
    Disease(name: 'Ovarian Cancer', treatment: 'Surgery and chemotherapy'),
    Disease(name: 'Crohn\'s Disease', treatment: 'Medications and surgery'),
    Disease(name: 'Ulcerative Colitis', treatment: 'Medications and surgery'),
    Disease(name: 'Multiple Sclerosis', treatment: 'Disease-modifying therapies'),
    Disease(name: 'Lupus', treatment: 'Medications and lifestyle changes'),
    Disease(name: 'Malaria', treatment: 'Antimalarial medications'),
    Disease(name: 'Tuberculosis', treatment: 'Antibiotics for an extended period'),
    Disease(name: 'AIDS', treatment: 'Antiretroviral therapy'),
    Disease(name: 'Hepatitis B', treatment: 'Antiviral medications'),
    Disease(name: 'Ovarian Cyst', treatment: 'Watchful waiting or surgery'),
    Disease(name: 'Endometriosis', treatment: 'Medications and surgery'),
    Disease(name: 'Glaucoma', treatment: 'Eye drops and surgery'),
    Disease(name: 'Hemorrhoids', treatment: 'Dietary changes and medications'),
    Disease(name: 'Ovarian Cancer', treatment: 'Surgery and chemotherapy'),
    Disease(name: 'Prostate Cancer', treatment: 'Surgery, radiation, or hormone therapy'),
    Disease(name: 'Thyroid Disorders', treatment: 'Medications and hormone therapy'),
    Disease(name: 'HIV/AIDS', treatment: 'Antiretroviral therapy'),
  ];

  List<Disease> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: _search,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search for diseases...',
              hintStyle: TextStyle(color: Colors.white70),
              prefixIcon: Icon(Icons.search, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Expanded(
          child: _searchResults.isNotEmpty
              ? _buildSearchResults()
              : Center(
            child: Text(
              'No results found',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        Disease disease = _searchResults[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 4,
          child: ListTile(
            title: Text(
              disease.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            subtitle: Text(
              'Treatment: ${disease.treatment}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }

  void _search(String query) {
    query = query.toLowerCase();
    setState(() {
      _searchResults = _allDiseases
          .where((disease) =>
      disease.name.toLowerCase().contains(query) ||
          disease.treatment.toLowerCase().contains(query))
          .toList();
    });
  }
}
