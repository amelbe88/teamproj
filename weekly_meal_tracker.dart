import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting day names
import 'package:path_provider/path_provider.dart'; // For file paths
import 'package:pdf/pdf.dart'; // For generating PDFs
import 'package:pdf/widgets.dart' as pw; // For PDF widgets
import 'package:printing/printing.dart'; // For printing PDFs
import 'package:screenshot/screenshot.dart'; // For taking screenshots
import 'dart:io';

class WeeklyMealOverview extends StatelessWidget {
  final Map<String, String> sampleMeals = {
    "2025-04-22": "Breakfast: Pancakes, Lunch: Salad",
    "2025-04-23": "Breakfast: Eggs, Lunch: Sandwich",
    "2025-04-24": "Breakfast: Oatmeal, Lunch: Burger",
    // Add more sample data if needed
  };

  List<Map<String, String>> getLast7DaysMeals() {
    List<Map<String, String>> last7Days = [];

    DateTime today = DateTime.now();
    for (int i = 0; i < 7; i++) {
      DateTime day = today.subtract(Duration(days: i));
      String dateKey = "${day.year}-${day.month}-${day.day}";
      String? meals = sampleMeals[dateKey];

      List<String> parts =
          meals?.split(',') ?? ["Breakfast: No record", "Lunch: No record"];

      last7Days.add({
        'date': "${day.day}/${day.month}/${day.year}",
        'dayName': DateFormat('EEEE').format(day), // Full day name
        'breakfast':
            parts.isNotEmpty ? parts[0].trim() : "Breakfast: No record",
        'lunch': parts.length > 1 ? parts[1].trim() : "Lunch: No record",
      });
    }
    return last7Days;
  }

  // Screenshot controller to capture widget
  final ScreenshotController screenshotController = ScreenshotController();

  // Export to PDF method
  Future<void> _exportToPDF(List<Map<String, String>> meals) async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: meals.map((meal) {
            return pw.Row(
              children: [
                pw.Text(meal['dayName']!),
                pw.Text(meal['breakfast']!),
                pw.Text(meal['lunch']!),
              ],
            );
          }).toList(),
        );
      },
    ));
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/meals.pdf");
    await file.writeAsBytes(await pdf.save());
    Printing.sharePdf(bytes: await pdf.save(), filename: 'Meals_This_Week.pdf');
  }

  // Export to Image method
  Future<void> _exportToImage(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/meals_screenshot.png';
    screenshotController.captureAndSave(directory.path,
        fileName: "meals_screenshot.png");
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Image saved at: $path')));
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> meals = getLast7DaysMeals();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Meals This Week'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () => _exportToPDF(meals), // PDF Export
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () =>
                _exportToImage(context), // Pass context for Image Export
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Screenshot(
          controller: screenshotController,
          child: ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                color: Colors.orange[50],
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal['dayName']!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14, // smaller but not too small
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Breakfast:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.orange),
                                ),
                                Text(
                                  meal['breakfast']!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Lunch:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.orange),
                                ),
                                Text(
                                  meal['lunch']!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
