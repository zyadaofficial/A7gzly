import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class SwipeToPayButton extends StatefulWidget {
  final double totalPrice;
  final VoidCallback onConfirmed;

  const SwipeToPayButton({
    super.key,
    required this.totalPrice,
    required this.onConfirmed,
  });

  @override
  State<SwipeToPayButton> createState() => _SwipeToPayButtonState();
}

class _SwipeToPayButtonState extends State<SwipeToPayButton>
    with SingleTickerProviderStateMixin {
  double _dragPosition = 0;
  bool _confirmed = false;
  late AnimationController _shimmerController;

  static const double _thumbSize = 56;
  static const double _pad = 6;

  double get _maxDrag {
    final w = MediaQuery.of(context).size.width - 40;
    return w - _thumbSize - (_pad * 2);
  }

  double get _progress =>
      (_maxDrag > 0) ? (_dragPosition / _maxDrag).clamp(0, 1) : 0;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails d) {
    if (_confirmed) return;
    setState(() {
      _dragPosition = (_dragPosition + d.delta.dx).clamp(0, _maxDrag);
    });
  }

  void _onDragEnd(DragEndDetails d) {
    if (_confirmed) return;
    if (_progress > 0.85) {
      setState(() {
        _dragPosition = _maxDrag;
        _confirmed = true;
      });
      widget.onConfirmed();
    } else {
      setState(() => _dragPosition = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _thumbSize + (_pad * 2),
      decoration: BoxDecoration(
        color: _confirmed
            ? AppColors.primaryLight
            : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: _confirmed ? AppColors.primary.withValues(alpha: 0.4) : AppColors.divider,
        ),
      ),
      child: Stack(
        children: [
          // Progress fill
          AnimatedContainer(
            duration: _confirmed
                ? const Duration(milliseconds: 300)
                : Duration.zero,
            width: _dragPosition + _thumbSize + (_pad * 2),
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.12),
                  AppColors.primary.withValues(alpha: 0.04),
                ],
              ),
              borderRadius: BorderRadius.circular(17),
            ),
          ),

          // Center text
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _progress > 0.3 ? 0 : 1,
              child: AnimatedBuilder(
                animation: _shimmerController,
                builder: (context, child) {
                  return ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          AppColors.textMuted,
                          AppColors.textPrimary,
                          AppColors.textMuted,
                        ],
                        stops: [
                          (_shimmerController.value - 0.3).clamp(0, 1),
                          _shimmerController.value,
                          (_shimmerController.value + 0.3).clamp(0, 1),
                        ],
                      ).createShader(bounds);
                    },
                    child: child,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.lock_rounded,
                        color: Colors.white, size: 15),
                    const SizedBox(width: 8),
                    Text(
                      'Swipe to Pay ${widget.totalPrice.toInt()} EGP',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_rounded,
                        color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
          ),

          // Confirmed
          if (_confirmed)
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_rounded,
                      color: AppColors.primary, size: 20),
                  const SizedBox(width: 8),
                  Text('Payment Confirmed!',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16, fontWeight: FontWeight.w700,
                      )),
                ],
              ),
            ),

          // Thumb
          AnimatedPositioned(
            duration: _confirmed
                ? const Duration(milliseconds: 300)
                : Duration.zero,
            curve: Curves.easeOutCubic,
            left: _dragPosition + _pad,
            top: _pad,
            child: GestureDetector(
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: _onDragEnd,
              child: Container(
                width: _thumbSize,
                height: _thumbSize,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  _confirmed
                      ? Icons.check_rounded
                      : Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
