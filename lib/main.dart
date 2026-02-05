import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorProfilePage(),
    );
  }
}

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Profile"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Doctor image
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/doctor.png"),
            ),
            const SizedBox(height: 17),

            // Name
            const Text(
              "Dr. Ahmed Abdul-Aziz",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Eye Special",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 8),

            // Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 4),
                Text("7"),
              ],
            ),

            const SizedBox(height: 16),

            // Call buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _iconButton(Icons.telegram),
                const SizedBox(width: 18),
                _iconButton(Icons.call),
              ],
            ),

            const SizedBox(height: 24),

            Center(
              child: Column(
                children: const [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Professor of Eye Special - Former Head of Department of Eye Special, Cairo University",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Hospital info
            _infoCard(
              children: const [
                _infoRow(Icons.local_hospital, "Cleopatra Hospital"),
                _infoRow(Icons.access_time, "10 - 10"),
                _infoRow(Icons.location_on, "2 Gamaa Street, Giza"),
              ],
            ),

            const SizedBox(height: 16),

            // Contact info
            _sectionTitle("Contact Info"),
            _infoCard(
              children: const [
                _infoRow(Icons.email, "dr@6.com"),
                _infoRow(Icons.phone, "01032564823"),
                _infoRow(Icons.phone, "01125466125"),
              ],
            ),

            const SizedBox(height: 24),

            // Buttons
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.chat),
              label: const Text("Chat With Dr. Ahmed"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Book an Appointment"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _iconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.blue),
    );
  }

  static Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget _infoCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }
}

class _infoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _infoRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
