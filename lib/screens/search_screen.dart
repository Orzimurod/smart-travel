import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/place.dart';
import 'place_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';
  String _selectedFilter = 'Barchasi';

  final _filters = ['Barchasi', 'Tarix', 'Restoran', 'Park'];

  List<Place> get _filteredPlaces {
    var list = SampleData.places;
    if (_query.isNotEmpty) {
      list = list
          .where((p) =>
              p.name.toLowerCase().contains(_query.toLowerCase()))
          .toList();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final results = _filteredPlaces;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Qidiruv'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (v) => setState(() => _query = v),
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Registon...',
                  prefixIcon: Icon(Icons.search,
                      color: AppColors.textMuted, size: 20),
                ),
              ),
            ),
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filters.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final f = _filters[i];
                  final selected = f == _selectedFilter;
                  return GestureDetector(
                    onTap: () =>
                        setState(() => _selectedFilter = f),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 7),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primary
                            : AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        f,
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Natijalar (${results.length} ta)',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: results.length,
                itemBuilder: (_, i) {
                  final p = results[i];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PlaceDetailScreen(place: p),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: p.category.color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(p.icon,
                                color: AppColors.primary),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    ...List.generate(
                                      5,
                                      (i) => Icon(
                                        i < p.rating.floor()
                                            ? Icons.star
                                            : Icons.star_border,
                                        size: 13,
                                        color: AppColors.warning,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '· ${p.distanceKm} km',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  p.category.label,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
