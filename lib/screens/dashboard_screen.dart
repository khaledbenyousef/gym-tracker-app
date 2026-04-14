import 'package:flutter/material.dart';
import 'workout_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWeight = 72;
    double goalWeight = 75;
    double difference = goalWeight - currentWeight;

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weight Card
            Card(
              child: ListTile(
                title: const Text("Current Weight"),
                subtitle: Text("$currentWeight kg"),
              ),
            ),

            const SizedBox(height: 10),

            // Goal Card
            Card(
              child: ListTile(
                title: const Text("Goal Weight"),
                subtitle: Text("$goalWeight kg"),
              ),
            ),

            const SizedBox(height: 10),

            // Difference Card
            Card(
              child: ListTile(
                title: const Text("Progress"),
                subtitle: Text(
                  difference > 0
                      ? "+${difference.toStringAsFixed(1)} kg to goal"
                      : "${difference.toStringAsFixed(1)} kg achieved",
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WorkoutScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
