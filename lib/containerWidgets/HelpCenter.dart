import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Help Center'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          _HelpCenterContainer(
            name: 'Hiwa Hospital',
            onTap: () {
              _navigateToDetails(context, 'Hiwa Hospital');
            },
          ),
          _HelpCenterContainer(
            name: 'Autism Children Center',
            onTap: () {
              _navigateToDetails(context, 'Autism Children Center');
            },
          ),
        ],
      ),
    );
  }

  void _navigateToDetails(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HelpCenterDetailsPage(name: name)),
    );
  }
}

class _HelpCenterContainer extends StatefulWidget {
  final String name;
  final VoidCallback onTap;

  _HelpCenterContainer({required this.name, required this.onTap});

  @override
  __HelpCenterContainerState createState() => __HelpCenterContainerState();
}

class __HelpCenterContainerState extends State<_HelpCenterContainer> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: (_) => _animationController.forward(),
        onTapUp: (_) {
          _animationController.reverse();
          widget.onTap();
        },
        onTapCancel: () => _animationController.reverse(),
        child: Container(
          height: 100,
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class HelpCenterDetailsPage extends StatelessWidget {
  final String name;

  HelpCenterDetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(name),
      ),
      body: _HelpCenterDetails(name: name),
    );
  }
}

class _HelpCenterDetails extends StatelessWidget {
  final String name;

  _HelpCenterDetails({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Details for $name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Add more fields and content as needed
          TextFormField(
            decoration: InputDecoration(labelText: 'Your Name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Contact Information'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Help Request'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement logic to submit help request
              // This can include sending data to a server or other actions as needed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Help request submitted for $name'),
                ),
              );
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
