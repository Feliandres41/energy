import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrapickOneWidget extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const GrapickOneWidget({super.key, required this.data});

  @override
  State<GrapickOneWidget> createState() => _GrapickOneWidgetState();
}

class _GrapickOneWidgetState extends State<GrapickOneWidget> {
  String _formatDateLabel(String date) {
    try {
      final parsed = DateTime.parse(date);
      const months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '${months[parsed.month - 1]} ${parsed.day}';
    } catch (_) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      return SizedBox(
        height: 300,
        child: Center(
          child: Text(
            'Cargando datos...',
            style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.8)),
          ),
        ),
      );
    }

    final sortedData = List<Map<String, dynamic>>.from(widget.data)
      ..sort((a, b) {
        final aFecha = a['fecha']?.toString() ?? '';
        final bFecha = b['fecha']?.toString() ?? '';
        return aFecha.compareTo(bFecha);
      });

    final spotsConsumo = <FlSpot>[];
    final spotsProduccion = <FlSpot>[];
    final titles = <String>[];

    for (var i = 0; i < sortedData.length; i++) {
      final row = sortedData[i];
      final consumo = row['consumo_kwh'];
      final produccion = row['produccion_solar_kwh'];
      final fecha = row['fecha']?.toString() ?? '';

      final consumoValue = consumo is num
          ? consumo.toDouble()
          : double.tryParse(consumo.toString()) ?? 0.0;
      final produccionValue = produccion is num
          ? produccion.toDouble()
          : double.tryParse(produccion.toString()) ?? 0.0;

      spotsConsumo.add(FlSpot(i.toDouble(), consumoValue));
      spotsProduccion.add(FlSpot(i.toDouble(), produccionValue));
      titles.add(_formatDateLabel(fecha));
    }

    final titleInterval = (sortedData.length / 6).ceil().clamp(1, sortedData.length);

    return SizedBox(
      height: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Consumo vs producción',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Row(
                children: const [
                  Icon(Icons.circle, size: 10, color: Colors.blue),
                  SizedBox(width: 6),
                  Text('Consumo', style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(width: 16),
              Row(
                children: const [
                  Icon(Icons.circle, size: 10, color: Colors.amber),
                  SizedBox(width: 6),
                  Text('Producción solar', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Row(
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'kWh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: LineChart(
                    LineChartData(
                      backgroundColor: const Color(0xFF050B18),
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: titleInterval.toDouble(),
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index < 0 || index >= titles.length) {
                                return const SizedBox.shrink();
                              }
                              if (index % titleInterval != 0 && index != titles.length - 1) {
                                return const SizedBox.shrink();
                              }
                              return Text(
                                titles[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: spotsConsumo,
                          isCurved: true,
                          color: Colors.blue,
                          barWidth: 3,
                          dotData: FlDotData(show: true),
                        ),
                        LineChartBarData(
                          spots: spotsProduccion,
                          isCurved: true,
                          color: Colors.amber,
                          barWidth: 3,
                          belowBarData: BarAreaData(
                            show: true,
                            color: const Color.fromRGBO(255, 193, 7, 0.2),
                          ),
                          dotData: FlDotData(show: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
