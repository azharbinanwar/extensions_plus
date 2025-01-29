import 'package:extensions_plus/extensions_plus.dart';
import 'package:flutter/material.dart';

class ThemeExtensionPage extends StatelessWidget {
  const ThemeExtensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Extensions Demo',
          style: context.titleLarge?.copyWith(color: context.onPrimary),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: context.onPrimary),
            onPressed: () => _showDeviceInfo(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: context.responsivePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildThemeSection(context),
            const SizedBox(height: 24),
            _buildDeviceInfoSection(context),
            const SizedBox(height: 24),
            _buildOverlayDemoSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context) {
    return Card(
      color: context.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Theme Demo', style: context.headlineMedium),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _ColorBox(
                  color: context.primary,
                  onColor: context.onPrimary,
                  label: 'Primary',
                ),
                _ColorBox(
                  color: context.primaryContainer,
                  onColor: context.onPrimaryContainer,
                  label: 'PrimaryContainer',
                ),
                _ColorBox(
                  color: context.primaryFixed,
                  onColor: context.onPrimaryFixed,
                  label: 'PrimaryFixed',
                ),
                _ColorBox(
                  color: context.primaryFixedDim,
                  onColor: context.primaryFixedDim.onIt,
                  label: 'PrimaryFixedDim',
                ),
                _ColorBox(
                  color: context.onPrimaryFixedVariant,
                  onColor: context.primary,
                  label: 'OnPrimaryFixedVariant',
                ),
                _ColorBox(
                  color: context.secondary,
                  onColor: context.onSecondary,
                  label: 'Secondary',
                ),
                _ColorBox(
                  color: context.secondaryContainer,
                  onColor: context.onSecondaryContainer,
                  label: 'SecondaryContainer',
                ),
                _ColorBox(
                  color: context.secondaryFixed,
                  onColor: context.onSecondaryFixed,
                  label: 'SecondaryFixed',
                ),
                _ColorBox(
                  color: context.secondaryFixedDim,
                  onColor: context.secondaryFixedDim.onIt,
                  label: 'SecondaryFixedDim',
                ),
                _ColorBox(
                  color: context.onSecondaryFixedVariant,
                  onColor: context.secondary,
                  label: 'OnSecondaryFixedVariant',
                ),
                _ColorBox(
                  color: context.tertiary,
                  onColor: context.onTertiary,
                  label: 'Tertiary',
                ),
                _ColorBox(
                  color: context.tertiaryContainer,
                  onColor: context.onTertiaryContainer,
                  label: 'TertiaryContainer',
                ),
                _ColorBox(
                  color: context.tertiaryFixed,
                  onColor: context.onTertiaryFixed,
                  label: 'TertiaryFixed',
                ),
                _ColorBox(
                  color: context.tertiaryFixedDim,
                  onColor: context.tertiaryFixedDim.onIt,
                  label: 'TertiaryFixedDim',
                ),
                _ColorBox(
                  color: context.onTertiaryFixedVariant,
                  onColor: context.tertiary,
                  label: 'OnTertiaryFixedVariant',
                ),
                _ColorBox(
                  color: context.error,
                  onColor: context.onError,
                  label: 'Error',
                ),
                _ColorBox(
                  color: context.errorContainer,
                  onColor: context.onErrorContainer,
                  label: 'ErrorContainer',
                ),
                _ColorBox(
                  color: context.surface,
                  onColor: context.onSurface,
                  label: 'Surface',
                ),
                _ColorBox(
                  color: context.surfaceContainer,
                  onColor: context.onSurface,
                  label: 'SurfaceContainer',
                ),
                _ColorBox(
                  color: context.surfaceContainerHigh,
                  onColor: context.onSurface,
                  label: 'SurfaceContainerHigh',
                ),
                _ColorBox(
                  color: context.surfaceContainerHighest,
                  onColor: context.onSurface,
                  label: 'SurfaceContainerHighest',
                ),
                _ColorBox(
                  color: context.onSurfaceVariant,
                  onColor: context.surface,
                  label: 'OnSurfaceVariant',
                ),
                _ColorBox(
                  color: context.outline,
                  onColor: context.surface,
                  label: 'Outline',
                ),
                _ColorBox(
                  color: context.shadow,
                  onColor: context.surface,
                  label: 'Shadow',
                ),
                _ColorBox(
                  color: context.scrim,
                  onColor: context.surface,
                  label: 'Scrim',
                ),
                _ColorBox(
                  color: context.inverseSurface,
                  onColor: context.onInverseSurface,
                  label: 'InverseSurface',
                ),
                _ColorBox(
                  color: context.inversePrimary,
                  onColor: context.primary,
                  label: 'InversePrimary',
                ),
                _ColorBox(
                  color: context.surfaceTint,
                  onColor: context.onSurface,
                  label: 'SurfaceTint',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Typography Demo', style: context.titleLarge),
            const SizedBox(height: 8),
            Text('Display Large', style: context.displayLarge),
            Text('Dipslay Medium', style: context.displayMedium),
            Text('Display Small', style: context.displaySmall),
            Text('Headline Large', style: context.headlineLarge),
            Text('Headline Medium', style: context.headlineMedium),
            Text('Headline Small', style: context.headlineSmall),
            Text('Title Large', style: context.titleLarge),
            Text('Title Medium', style: context.titleMedium),
            Text('Title Small', style: context.titleSmall),
            Text('Body Large', style: context.bodyLarge),
            Text('Body Medium', style: context.bodyMedium),
            Text('Body Small', style: context.bodySmall),
            Text('Label Large', style: context.labelLarge),
            Text('Label Medium', style: context.labelMedium),
            Text('Label Small', style: context.labelSmall),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceInfoSection(BuildContext context) {
    return Card(
      color: context.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Device Information', style: context.headlineMedium),
            const SizedBox(height: 16),
            _InfoRow('Screen Width', '${context.width}'),
            _InfoRow('Screen Height', '${context.height}'),
            _InfoRow(
                'Orientation', context.isLandscape ? 'Landscape' : 'Portrait'),
            _InfoRow('Device Type', _getDeviceType(context)),
            _InfoRow('Responsive Columns', '${context.responsiveColumns()}'),
            _InfoRow('Has Notch', '${context.hasNotch}'),
          ],
        ),
      ),
    );
  }

  Widget _buildOverlayDemoSection(BuildContext context) {
    return Card(
      color: context.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overlay Utilities', style: context.headlineMedium),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _showBottomSheetDemo(context),
                  child: const Text('Show Bottom Sheet'),
                ),
                ElevatedButton(
                  onPressed: () => _showSnackBarDemo(context),
                  child: const Text('Show Snackbar'),
                ),
                ElevatedButton(
                  onPressed: () => _showDialogDemo(context),
                  child: const Text('Show Dialog'),
                ),
                ElevatedButton(
                  onPressed: () => _showGeneralDialogDemo(context),
                  child: const Text('Show General Dialog'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getDeviceType(BuildContext context) {
    if (context.isMobile) return 'Mobile';
    if (context.isSmallTablet) return 'Small Tablet';
    if (context.isTablet) return 'Tablet';
    if (context.isDesktop) return 'Desktop';
    return 'Large Desktop';
  }

  void _showDeviceInfo(BuildContext context) {
    context.showAppGeneralDialog(
      title: 'Device Information',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _InfoRow('Pixel Ratio', '${context.devicePixelRatio}'),
          _InfoRow('Status Bar Height', '${context.statusBarHeight}'),
          _InfoRow('Bottom Padding', '${context.paddingBottom}'),
          _InfoRow('Top Padding', '${context.paddingTop}'),
        ],
      ),
    );
  }

  void _showBottomSheetDemo(BuildContext context) {
    context.showBottomSheet(
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bottom Sheet Demo', style: context.titleLarge),
            const SizedBox(height: 16),
            Text('This is a bottom sheet using the context extension.',
                style: context.bodyMedium),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBarDemo(BuildContext context) {
    context.showSnackBar(
      Text('This is a snackbar using the context extension',
          style: TextStyle(color: context.onPrimary)),
      backgroundColor: context.primary,
      action: SnackBarAction(
        label: 'Dismiss,',
        textColor: context.onPrimary,
        onPressed: () {},
      ),
    );
  }

  void _showDialogDemo(BuildContext context) {
    context.showAppDialog(
      title: const Text('Dialog Demo'),
      content: const Text('This is a dialog using the context extension.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }

  void _showGeneralDialogDemo(BuildContext context) {
    context.showAppGeneralDialog(
      title: 'General Dialog Demo',
      child:
          const Text('This is a general dialog using the context extension.'),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class _ColorBox extends StatelessWidget {
  final Color color;
  final Color onColor;
  final String label;

  const _ColorBox({
    required this.color,
    required this.onColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 160,
          height: 70,
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child:
                Text(label, style: context.bodySmall?.copyWith(color: onColor)),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: context.bodyMedium),
          Text(value,
              style: context.bodyMedium?.copyWith(
                  color: context.primary, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
