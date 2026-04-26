import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../theme/app_theme.dart';
import '../models/place.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  TransportType _selectedTransport = TransportType.piyoda;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Marshrut'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Marshrut rejalashtirish',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                    left: BorderSide(color: AppColors.primary, width: 4),
                  ),
                ),
                child: const Row(
                  children: [
                    Expanded(child: Text('Mustaqillik maydoni')),
                    Icon(Icons.swap_vert, color: AppColors.textMuted),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.surfaceLight,
                  borderRadius: BorderRadius.circular(12),
                  border: const Border(
                    left: BorderSide(color: Colors.red, width: 4),
                  ),
                ),
                child: const Row(
                  children: [
                    Expanded(child: Text('Chorsu bozori')),
                    Icon(Icons.close, color: AppColors.textMuted),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Transport turi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: TransportType.values.map((t) {
                    final selected = t == _selectedTransport;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () =>
                            setState(() => _selectedTransport = t),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.primary
                                : AppColors.surfaceLight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                t.icon,
                                size: 16,
                                color: selected
                                    ? Colors.white
                                    : AppColors.textPrimary,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                t.label,
                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : AppColors.textPrimary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _StatCard(
                      value: '3.2', unit: 'km', label: 'Masofa'),
                  const SizedBox(width: 10),
                  _StatCard(
                      value: '42', unit: 'daqiqa', label: 'Vaqt'),
                  const SizedBox(width: 10),
                  _StatCard(value: '5', unit: 'joy', label: 'To\'xtash'),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 240,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(41.3186, 69.2376),
                    initialZoom: 13,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.smart_travel',
                    ),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: [
                            LatLng(41.3111, 69.2406),
                            LatLng(41.3180, 69.2370),
                            LatLng(41.3261, 69.2347),
                          ],
                          strokeWidth: 3,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(41.3111, 69.2406),
                          width: 22,
                          height: 22,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white, width: 2.5),
                            ),
                          ),
                        ),
                        Marker(
                          point: LatLng(41.3261, 69.2347),
                          width: 22,
                          height: 22,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white, width: 2.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Marshrut boshlandi!'),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                },
                child: const Text('Marshrutni boshlash'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String unit;
  final String label;

  const _StatCard({
    required this.value,
    required this.unit,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              unit,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
