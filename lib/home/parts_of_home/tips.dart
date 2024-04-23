import 'package:flutter/material.dart';

class MotivationalTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motivational Tips'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTipCard(
              context,
              title: 'Set Clear Goals',
              description:
                  'Having clear, achievable goals helps you stay focused and motivated. Break down big goals into smaller, manageable tasks.',
              image: "assets/img/tips.png", // Replace with your image asset path
            ),
            SizedBox(height: 20),
            _buildTipCard(
              context,
              title: 'Stay Positive',
              description:
                  'Maintain a positive mindset even when facing challenges. Remember that setbacks are opportunities to learn and grow.',
              image: "assets/img/tips.png", // Replace with your image asset path
            ),
            SizedBox(height: 20),
            _buildTipCard(
              context,
              title: 'Take Breaks',
              description:
                  'Avoid burnout by taking regular breaks. Relaxation and downtime are essential for maintaining productivity and motivation.',
              image: "assets/img/tips.png", // Replace with your image asset path
            ),
            SizedBox(height: 20),
            _buildTipCard(
              context,
              title: 'Celebrate Progress',
              description:
                  'Acknowledge and celebrate your achievements, no matter how small. Rewarding yourself reinforces positive behavior.',
              image: "assets/img/tips.png", // Replace with your image asset path
            ),
            SizedBox(height: 20),
            _buildTipCard(
              context,
              title: 'Surround Yourself with Support',
              description:
                  'Surround yourself with supportive friends, family, and mentors who encourage and motivate you to reach your goals.',
              image: "assets/img/tips.png", // Replace with your image asset path
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(BuildContext context,
      {required String title,
      required String description,
      required String image}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 200, // Adjust as needed
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
