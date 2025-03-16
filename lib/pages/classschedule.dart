import 'package:flutter/material.dart';

class ClassSchedulePage extends StatelessWidget {
  const ClassSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors for styling
    const headerColor = Color(0xff007bff); // Blue header color
    const cellColor = Color(0xff0098f0); // Light blue cell color
    const textColor = Colors.white;

    // Schedule data
    final List<List<String>> schedule = [
      ["Day", "Period - 1", "Period - 2", "Period - 3", "Period - 4", "Period - 5", "Period - 6"],
      ["Mon", "ESC301 Surajit Sur", "HSMCS301 Prof. Sourav Chakraborty", "ESC302 Chatterjee", "BSM301 Priyanka Chhapparwal", "ESC391 Mr. Ladu Ram Gujar Surajit Sur", "ESC391 Mr. Ladu Ram Gujar Surajit Sur"],
      ["Tue", "PCCCS382 Saha", "HSMCS301 Prof. Sourav Chakraborty", "ESP301 Mr. Ashutosh Kumar Jha", "SDP381 Dr. SHIVAM CHAUHAN", "ESC392 Chatterjee", "ESC392 Chatterjee"],
      ["Wed", "BSM301 Priyanka Chhapparwal", "ESC301 Surajit Sur", "ESC302 Chatterjee", "PCC301 Santanu Basak", "ESC391 Mr. Ladu Ram Gujar Surajit Sur", "ESC391 Mr. Ladu Ram Gujar Surajit Sur"],
      ["Thu", "PCC301 Santanu Basak", "BSM301 Priyanka Chhapparwal", "SDP381 KRISHNA KUMAR SHARMA", "ESP301 Mr. Ashutosh Kumar Jha", "ESC392 Chatterjee", "ESC392 Chatterjee"],
      ["Fri", "PCC301 Santanu Basak", "ESC302 Chatterjee", "ESC301 Surajit Sur", "HSMCS301 Prof. Sourav Chakraborty", "PCCCS382 Saha", "PCCCS382 Saha"],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Schedule'),
        backgroundColor: headerColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(color: Colors.black, width: 1),
              defaultColumnWidth: const IntrinsicColumnWidth(),
              children: schedule.asMap().entries.map((entry) {
                int index = entry.key;
                List<String> row = entry.value;
                return TableRow(
                  decoration: BoxDecoration(
                    color: index == 0 ? headerColor : cellColor,
                  ),
                  children: row.map((cell) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          cell,
                          style: TextStyle(
                            fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                            fontSize: 14,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}