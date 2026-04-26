import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'OA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Abdullayev Odilbek',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'odilbek@gmail.com',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _StatBlock(value: '8', label: 'Marshrut'),
                    _StatBlock(value: '21', label: 'Saqlangan'),
                    _StatBlock(value: '5', label: 'Sharh'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _MenuItem(
                color: AppColors.cardBlue,
                icon: Icons.bookmark,
                label: 'Saqlangan joylar',
                onTap: () {},
              ),
              _MenuItem(
                color: AppColors.cardGreen,
                icon: Icons.map,
                label: 'Toshkent marshrutlarim',
                onTap: () {},
              ),
              _MenuItem(
                color: AppColors.cardLightBlue,
                icon: Icons.cloud_off,
                label: 'Offline xaritalar',
                onTap: () {},
              ),
              _MenuItem(
                color: AppColors.cardLightBlue,
                icon: Icons.language,
                label: "Til: O'zbek",
                onTap: () {},
              ),
              _MenuItem(
                color: const Color(0xFFFEE2E2),
                icon: Icons.logout,
                iconColor: Colors.red,
                label: 'Chiqish',
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  final String value;
  final String label;

  const _StatBlock({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color? iconColor;
  final String label;
  final VoidCallback onTap;

  const _MenuItem({
    required this.color,
    required this.icon,
    this.iconColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? AppColors.primary, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            Icon(Icons.chevron_right,
                color: iconColor ?? AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
