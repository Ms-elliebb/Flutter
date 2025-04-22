import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/drawing_notifier.dart';
import '../../domain/drawing_tool.dart';

/// A toolbar providing drawing controls like tool selection, color picker,
/// stroke width slider, and clear button.
/// Interacts with [DrawingNotifier] to manage the drawing state for a specific [roomId].
class DrawingToolbar extends ConsumerWidget {
  /// The identifier for the room whose state this toolbar controls.
  final String roomId;

  const DrawingToolbar({required this.roomId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(drawingNotifierProvider(roomId));
    final notifier = ref.read(drawingNotifierProvider(roomId).notifier);
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      // Arka plan ve gölge
      decoration: BoxDecoration(
        color: theme.colorScheme.surface, // Tema yüzey rengi
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1), // Gölge altta
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alanı daha iyi kullan
        children: [
          // --- Araç Seçimi --- 
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ToolButton(
                icon: Icons.brush, // Daha uygun bir ikon
                tool: DrawingTool.pen,
                isSelected: state.selectedTool == DrawingTool.pen,
                onTap: () => notifier.selectTool(DrawingTool.pen),
              ),
              const SizedBox(width: 4),
              _ToolButton(
                icon: Icons.auto_fix_normal, // Yeni, daha uygun silgi ikonu
                tool: DrawingTool.eraser,
                isSelected: state.selectedTool == DrawingTool.eraser,
                onTap: () => notifier.selectTool(DrawingTool.eraser),
              ),
            ],
          ),
          // --- Renk Seçici --- 
          _ColorPickerButton(
            currentColor: state.selectedColor,
            onColorSelected: notifier.selectColor,
          ),
          // --- Kalınlık Ayarı --- 
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.line_weight, color: theme.colorScheme.onSurface.withOpacity(0.6)), // Daha güvenli renk kullanımı
              SizedBox(
                width: 120, // Slider için sabit genişlik
                child: Slider(
                  value: state.selectedStrokeWidth,
                  min: 1.0,
                  max: 20.0,
                  divisions: 19,
                  // label: state.selectedStrokeWidth.toStringAsFixed(1), // Label'ı kaldırdık, slider yeterli
                  onChanged: notifier.selectStrokeWidth,
                  // Tema renkleri main.dart'ta ayarlandı
                ),
              ),
            ],
          ),
          
          // --- Temizle Butonu --- 
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Clear Canvas',
            iconSize: 26,
            onPressed: () => notifier.clearCanvas(),
          ),
        ],
      ),
    );
  }
}

/// Color Picker Button Widget
class _ColorPickerButton extends StatelessWidget {
  final Color currentColor;
  final ValueChanged<Color> onColorSelected;

  const _ColorPickerButton({
    required this.currentColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Select Color',
      icon: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: currentColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400, width: 1.5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2)
          ]
        ),
      ),
      onPressed: () => _showColorPickerDialog(context, currentColor, onColorSelected),
    );
  }

  /// Shows the color picker dialog.
  void _showColorPickerDialog(BuildContext context, Color initialColor, ValueChanged<Color> onColorChanged) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: initialColor,
            onColorChanged: onColorChanged,
            pickerAreaHeightPercent: 0.8,
            // Material Design renk paletlerini göster
            enableAlpha: false, // Alfa kanalı seçimi kapalı
            displayThumbColor: true,
            paletteType: PaletteType.hsvWithHue,
            // Diğer opsiyonlar: hsv, hsl, rgb, material, block
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        // Tema DialogTheme'den geliyor
      ),
    );
  }
}

/// Tool Selection Button Widget
class _ToolButton extends StatelessWidget {
  final IconData icon;
  final DrawingTool tool;
  final bool isSelected;
  final VoidCallback onTap;

  const _ToolButton({
    required this.icon,
    required this.tool,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final Color foregroundColor = isSelected ? theme.colorScheme.primary : theme.iconButtonTheme.style?.foregroundColor ?? Colors.black87; // Eski hali
    
    // Foreground rengini daha güvenli alalım
    Color defaultIconColor = theme.colorScheme.onSurface.withOpacity(0.8);
    Color? themeIconColor = theme.iconButtonTheme.style?.foregroundColor?.resolve({}); // Resolve default state
    Color nonSelectedColor = (themeIconColor is Color) ? themeIconColor : defaultIconColor;
    
    final Color foregroundColor = isSelected ? theme.colorScheme.primary : nonSelectedColor;
    final Color? backgroundColor = isSelected ? theme.colorScheme.primary.withOpacity(0.15) : null;

    return IconButton(
      icon: Icon(icon, color: foregroundColor),
      tooltip: tool.toString().split('.').last, // Display tool name
      onPressed: onTap,
      style: IconButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        // Seçili butona hafif yuvarlak bir arka plan
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      iconSize: 26,
    );
  }
}
