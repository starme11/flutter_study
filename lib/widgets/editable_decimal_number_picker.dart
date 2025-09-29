import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class EditableDecimalNumberPicker extends StatefulWidget {
  final double min;
  final double max;
  final double current;
  final String unit;
  final ValueChanged<double> onChanged;

  const EditableDecimalNumberPicker({
    super.key,
    required this.min,
    required this.max,
    required this.current,
    required this.unit,
    required this.onChanged,
  });

  @override
  State<EditableDecimalNumberPicker> createState() =>
      _EditableDecimalNumberPickerState();
}

class _EditableDecimalNumberPickerState
    extends State<EditableDecimalNumberPicker> {
  late int _value; // 내부적으로는 100배 정수로 관리
  bool _isEditing = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _value = (widget.current * 100).round();
    _controller = TextEditingController(
      text: (widget.current).toStringAsFixed(2),
    );
  }

  void _applyTextInput() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      setState(() => _isEditing = false);
      return;
    }
    try {
      double newValue = double.parse(text);

      // 범위 보정
      if (newValue < widget.min) newValue = widget.min;
      if (newValue > widget.max) newValue = widget.max;

      setState(() {
        _value = (newValue * 100).round();
        _isEditing = false;
      });
      widget.onChanged(newValue);
    } catch (_) {
      setState(() => _isEditing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isEditing
        ? SizedBox(
            width: 100,
            child: TextField(
              controller: _controller,
              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => _applyTextInput(),
              onEditingComplete: _applyTextInput,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                _controller.text = (_value / 100).toStringAsFixed(2);
                _isEditing = true;
              });
            },
            child: NumberPicker(
              minValue: (widget.min * 100).round(),
              maxValue: (widget.max * 100).round(),
              value: _value,
              step: 5, // 0.05 단위
              itemHeight: 60,
              axis: Axis.vertical,
              textMapper: (text) => (int.parse(text) / 100).toStringAsFixed(2),
              onChanged: (v) {
                setState(() => _value = v);
                widget.onChanged(v / 100.0);
              },
            ),
          );
  }
}
