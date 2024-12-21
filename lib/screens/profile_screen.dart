import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_outline,
              color: AppColors.textPrimary,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Guest',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Sign in to your account',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? AppColors.error : AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? AppColors.error : AppColors.textPrimary,
        ),
      ),
      trailing: trailing ??
          const Icon(Icons.chevron_right, color: AppColors.textSecondary),
      onTap: onTap,
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          children: [
            _buildProfileHeader(),
            _buildSection(
              'Account',
              [
                _buildListTile(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Orders',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.replay_outlined,
                  title: 'Returns',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.favorite_border,
                  title: 'Wishlist',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.location_on_outlined,
                  title: 'Addresses',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.payment_outlined,
                  title: 'Payment',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Wallet',
                  onTap: () {},
                ),
              ],
            ),
            _buildSection(
              'Personalization',
              [
                _buildListTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notification',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.accent,
                  ),
                ),
                _buildListTile(
                  icon: Icons.tune_outlined,
                  title: 'Preferences',
                  onTap: () {},
                ),
              ],
            ),
            _buildSection(
              'Settings',
              [
                _buildListTile(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.location_on_outlined,
                  title: 'Location',
                  onTap: () {},
                ),
              ],
            ),
            _buildSection(
              'Help & Support',
              [
                _buildListTile(
                  icon: Icons.headphones_outlined,
                  title: 'Get Help',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.help_outline,
                  title: 'FAQ',
                  onTap: () {},
                ),
              ],
            ),
            _buildListTile(
              icon: Icons.logout,
              title: 'Log Out',
              isDestructive: true,
              onTap: () {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
