import 'package:flutter/material.dart';

class FBCalendar extends StatefulWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime?>? onDateChanged;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color? selectedColor;
  final Color? todayColor;
  final Color? backgroundColor;
  final TextStyle? selectedTextStyle;
  final bool showWeekdays;

  const FBCalendar._({
    super.key,
    this.selectedDate,
    this.onDateChanged,
    required this.firstDate,
    required this.lastDate,
    this.selectedColor,
    this.todayColor,
    this.backgroundColor,
  }) : selectedTextStyle = null,
       showWeekdays = true;

  // Default → standard
  factory FBCalendar({
    Key? key,
    DateTime? selectedDate,
    ValueChanged<DateTime?>? onDateChanged,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    return FBCalendar.standard(
      key: key,
      selectedDate: selectedDate,
      onDateChanged: onDateChanged,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365 * 10)),
    );
  }

  // -------- STANDARD --------
  factory FBCalendar.standard({
    Key? key,
    DateTime? selectedDate,
    ValueChanged<DateTime?>? onDateChanged,
    required DateTime firstDate,
    required DateTime lastDate,
    Color? selectedColor,
    Color? todayColor,
  }) {
    return FBCalendar._(
      key: key,
      selectedDate: selectedDate,
      onDateChanged: onDateChanged,
      firstDate: firstDate,
      lastDate: lastDate,
      selectedColor: selectedColor,
      todayColor: todayColor,
    );
  }

  // -------- RANGE (deliberately purple, distinct from the brand) --------
  factory FBCalendar.range({
    Key? key,
    DateTime? selectedDate,
    ValueChanged<DateTime?>? onDateChanged,
    required DateTime firstDate,
    required DateTime lastDate,
  }) {
    return FBCalendar._(
      key: key,
      selectedDate: selectedDate,
      onDateChanged: onDateChanged,
      firstDate: firstDate,
      lastDate: lastDate,
      selectedColor: Colors.purple,
      backgroundColor: Colors.purple.shade50,
    );
  }

  @override
  State<FBCalendar> createState() => _FBCalendarState();
}

class _FBCalendarState extends State<FBCalendar> {
  late DateTime _currentDate;
  late DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _selectedDate = widget.selectedDate;
  }

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedColor = widget.selectedColor ?? colorScheme.primary;
    final todayColor = widget.todayColor ?? colorScheme.secondary;
    final backgroundColor = widget.backgroundColor ?? colorScheme.surface;

    final firstDayOfMonth = DateTime(_currentDate.year, _currentDate.month, 1);
    final lastDayOfMonth = DateTime(
      _currentDate.year,
      _currentDate.month + 1,
      0,
    );
    final daysInMonth = lastDayOfMonth.day;
    final startingWeekday = firstDayOfMonth.weekday;

    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with month/year
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: _previousMonth,
              ),
              Text(
                '${months[_currentDate.month - 1]} ${_currentDate.year}',
                style: theme.textTheme.titleMedium,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: _nextMonth,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Weekdays
          if (widget.showWeekdays)
            Row(
              children: weekdays
                  .map(
                    (day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          const SizedBox(height: 8),
          // Calendar grid
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(startingWeekday - 1 + daysInMonth, (index) {
              if (index < startingWeekday - 1) {
                return const SizedBox();
              }

              final day = index - (startingWeekday - 1) + 1;
              final date = DateTime(_currentDate.year, _currentDate.month, day);
              final isSelected =
                  _selectedDate?.year == date.year &&
                  _selectedDate?.month == date.month &&
                  _selectedDate?.day == date.day;
              final isToday =
                  DateTime.now().year == date.year &&
                  DateTime.now().month == date.month &&
                  DateTime.now().day == date.day;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });
                  widget.onDateChanged?.call(date);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? selectedColor
                        : isToday
                        ? todayColor.withValues(alpha: 0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      day.toString(),
                      style: isSelected
                          ? widget.selectedTextStyle ??
                                TextStyle(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                )
                          : TextStyle(
                              color: isToday
                                  ? todayColor
                                  : colorScheme.onSurface,
                            ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
