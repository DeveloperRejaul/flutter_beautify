import 'package:flutter/material.dart';

class FBCalendar extends StatefulWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime?>? onDateChanged;
  final DateTime firstDate;
  final DateTime lastDate;
  final Color selectedColor;
  final Color todayColor;
  final Color backgroundColor;
  final TextStyle? selectedTextStyle;
  final bool showWeekdays;

  const FBCalendar._({
    super.key,
    this.selectedDate,
    this.onDateChanged,
    required this.firstDate,
    required this.lastDate,
    this.selectedColor = Colors.blue,
    this.todayColor = Colors.green,
    this.backgroundColor = Colors.white,
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
  }) {
    return FBCalendar._(
      key: key,
      selectedDate: selectedDate,
      onDateChanged: onDateChanged,
      firstDate: firstDate,
      lastDate: lastDate,
      selectedColor: Colors.blue,
      todayColor: Colors.green,
    );
  }

  // -------- RANGE --------
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
      color: widget.backgroundColor,
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
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
                        ? widget.selectedColor
                        : isToday
                        ? widget.todayColor.withValues(alpha: 0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      day.toString(),
                      style: isSelected
                          ? widget.selectedTextStyle ??
                                const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                          : TextStyle(
                              color: isToday
                                  ? widget.todayColor
                                  : Colors.black87,
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
