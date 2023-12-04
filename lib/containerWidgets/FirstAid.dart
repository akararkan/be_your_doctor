import 'package:flutter/material.dart';

class FirstAidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Information'),
      ),
      body: ListView(
        children: [
          FirstAidCard(
            title: 'Car Accident',
            details: "First aid information for car accidents:\n" +
                "Check for injuries and call for emergency help.\n" +
                "If the person is unconscious, perform CPR if trained.\n" +
                "Control bleeding and protect the person from further harm.\n" +
                "Keep the person warm and reassure them until help arrives.\n",
          ),
          FirstAidCard(
            title: 'Burning',
            details: "First aid information for burns:\n" +
                "Cool the burn with cool running water for at least 10 minutes.\n" +
                "Remove clothing and jewelry around the burn area.\n" +
                "Cover the burn with a sterile non-stick dressing or clean cloth.\n" +
                "Seek medical attention if it's a severe burn.\n",
          ),
          FirstAidCard(
            title: 'Cutting',
            details: "First aid information for cuts:\n" +
                "Wash your hands thoroughly before providing aid.\n" +
                "Clean the cut with mild soap and water.\n" +
                "Apply an antibiotic ointment and cover with a sterile bandage.\n" +
                "Elevate the injured area if possible to reduce swelling.\n",
          ),
          FirstAidCard(
            title: 'Falling',
            details: "First aid information for falls:\n" +
                "Assess for injuries and call for emergency help if needed.\n" +
                "Keep the person still and reassure them.\n" +
                "Check for signs of head or spinal injury and avoid moving the person.\n" +
                "If unconscious, monitor breathing and perform CPR if necessary.\n",
          ),
          FirstAidCard(
            title: 'Heart Attack',
            details: "First aid information for heart attacks:\n" +
                "Call emergency services immediately.\n" +
                "Have the person sit down, rest, and try to keep calm.\n" +
                "Administer aspirin if available and the person isn't allergic.\n" +
                "Perform CPR if the person becomes unconscious and stops breathing.\n",
          ),
          FirstAidCard(
            title: 'Choking',
            details: "First aid information for choking:\n" +
                "Encourage the person to cough if they can.\n" +
                "Perform abdominal thrusts (Heimlich maneuver) if the person is unable to breathe.\n" +
                "Call for emergency help if the person is not able to cough or breathe.\n",
          ),
          FirstAidCard(
            title: 'Drowning',
            details: "First aid information for drowning:\n" +
                "Remove the person from the water.\n" +
                "Check for breathing and start CPR if the person is not breathing.\n" +
                "Call emergency services for help.\n" +
                "Keep the person warm and monitor their condition until help arrives.\n",
          ),
          FirstAidCard(
            title: 'Electric Shock',
            details: "First aid information for electric shocks:\n" +
                "Ensure the area is safe before approaching the person.\n" +
                "Do not touch the person if they are still in contact with the electrical source.\n" +
                "Call emergency services and perform CPR if the person is not breathing.\n" +
                "Keep the person still and reassure them until help arrives.\n",
          ),
          FirstAidCard(
            title: 'Poisoning',
            details: "First aid information for poisoning:\n" +
                "Call emergency services immediately.\n" +
                "If the person is conscious, try to determine what they ingested.\n" +
                "Do not try to induce vomiting unless advised by emergency services.\n" +
                "Keep the person calm and monitor their condition until help arrives.\n",
          ),
          FirstAidCard(
            title: 'Seizure',
            details: "First aid information for seizures:\n" +
                "Stay calm and ensure the person's safety.\n" +
                "Keep the person away from harmful objects and place them on their side.\n" +
                "Do not put anything in the person's mouth.\n" +
                "After the seizure, stay with the person and offer reassurance.\n",
          ),
          FirstAidCard(
            title: 'Stroke',
            details: "First aid information for strokes:\n" +
                "Call emergency services immediately.\n" +
                "Note the time when the symptoms started.\n" +
                "Keep the person calm and comfortable.\n" +
                "Do not give them anything to eat or drink.\n",
          ),
          FirstAidCard(
            title: 'Fracture',
            details: "First aid information for fractures:\n" +
                "Call emergency services for help.\n" +
                "Immobilize the injured area using a splint or support.\n" +
                "Apply ice to reduce swelling (do not apply directly to the skin).\n" +
                "Keep the person calm and reassure them until help arrives.\n",
          ),
        ],
      ),
    );
  }
}

class FirstAidCard extends StatelessWidget {
  final String title;
  final String details;

  const FirstAidCard({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView(
                  children: [
                    Text(details, style: TextStyle(fontSize: 25)),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          trailing: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
