import 'package:flutter/material.dart';

class FBPagination extends StatefulWidget {
  final int totalPages;
  final int currentPage;
  final ValueChanged<int>? onPageChanged;
  final int visiblePages;
  final Color? activeColor;
  final Color? inactiveColor;
  final double pageSize;

  const FBPagination._({
    super.key,
    required this.totalPages,
    this.currentPage = 1,
    this.onPageChanged,
    this.visiblePages = 5,
    this.pageSize = 40,
    this.activeColor,
    this.inactiveColor,
  });

  // Default → standard
  factory FBPagination({
    Key? key,
    required int totalPages,
    int currentPage = 1,
    ValueChanged<int>? onPageChanged,
  }) {
    return FBPagination.standard(
      key: key,
      totalPages: totalPages,
      currentPage: currentPage,
      onPageChanged: onPageChanged,
    );
  }

  // -------- STANDARD --------
  factory FBPagination.standard({
    Key? key,
    required int totalPages,
    int currentPage = 1,
    ValueChanged<int>? onPageChanged,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return FBPagination._(
      key: key,
      totalPages: totalPages,
      currentPage: currentPage,
      onPageChanged: onPageChanged,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      visiblePages: 5,
    );
  }

  // -------- MINIMAL --------
  factory FBPagination.minimal({
    Key? key,
    required int totalPages,
    int currentPage = 1,
    ValueChanged<int>? onPageChanged,
  }) {
    return FBPagination._(
      key: key,
      totalPages: totalPages,
      currentPage: currentPage,
      onPageChanged: onPageChanged,
      visiblePages: 3,
      pageSize: 32,
    );
  }

  @override
  State<FBPagination> createState() => _FBPaginationState();
}

class _FBPaginationState extends State<FBPagination> {
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final activeColor = widget.activeColor ?? colorScheme.primary;
    final inactiveColor = widget.inactiveColor ?? colorScheme.outline;
    final List<int> pageNumbers = _getVisiblePages();

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      alignment: WrapAlignment.center,
      children: [
        // Previous button
        if (_currentPage > 1)
          _buildPageButton(
            label: 'Prev',
            page: _currentPage - 1,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onPrimary: colorScheme.onPrimary,
          ),

        // Page numbers
        ...pageNumbers.map(
          (page) => _buildPageButton(
            label: page.toString(),
            page: page,
            isActive: page == _currentPage,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onPrimary: colorScheme.onPrimary,
          ),
        ),

        // Next button
        if (_currentPage < widget.totalPages)
          _buildPageButton(
            label: 'Next',
            page: _currentPage + 1,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
            onPrimary: colorScheme.onPrimary,
          ),
      ],
    );
  }

  Widget _buildPageButton({
    required String label,
    required int page,
    required Color activeColor,
    required Color inactiveColor,
    required Color onPrimary,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentPage = page;
        });
        widget.onPageChanged?.call(page);
      },
      child: Container(
        width: widget.pageSize,
        height: widget.pageSize,
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          border: Border.all(color: isActive ? activeColor : inactiveColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? onPrimary : inactiveColor,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  List<int> _getVisiblePages() {
    int startPage = 1;
    int endPage = widget.totalPages;

    if (widget.totalPages > widget.visiblePages) {
      int halfVisible = widget.visiblePages ~/ 2;
      if (_currentPage <= halfVisible + 1) {
        endPage = widget.visiblePages;
      } else if (_currentPage >= widget.totalPages - halfVisible) {
        startPage = widget.totalPages - widget.visiblePages + 1;
      } else {
        startPage = _currentPage - halfVisible;
        endPage = _currentPage + halfVisible;
      }
    }

    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }
}
