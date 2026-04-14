import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<Map<String, dynamic>> exercises = [];

  void addExercise() {
    setState(() {
      exercises.add({'name': 'New Exercise', 'sets': []});
    });
  }

  void addSet(int exerciseIndex) {
    setState(() {
      exercises[exerciseIndex]['sets'].add({'reps': 0, 'weight': 0.0});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workout")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...exercises.asMap().entries.map((entry) {
            int index = entry.key;
            var exercise = entry.value;

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Sets
                    ...exercise['sets'].asMap().entries.map((setEntry) {
                      int setIndex = setEntry.key;
                      var set = setEntry.value;

                      return Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: "Reps",
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                set['reps'] = int.tryParse(value) ?? 0;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: "Weight",
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                set['weight'] = double.tryParse(value) ?? 0.0;
                              },
                            ),
                          ),
                        ],
                      );
                    }),

                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: () => addSet(index),
                      child: const Text("+ Add Set"),
                    ),
                  ],
                ),
              ),
            );
          }),

          ElevatedButton(
            onPressed: addExercise,
            child: const Text("+ Add Exercise"),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              // Save logic later
              print(exercises);
            },
            child: const Text("Save Workout"),
          ),
        ],
      ),
    );
  }
}
