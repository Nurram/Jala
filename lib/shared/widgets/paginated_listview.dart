import 'package:flutter/material.dart';

class PaginatedListview extends StatelessWidget {
  final bool isLoading;

  final int itemCount;
  final Widget separator;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final Function() onReachLastItem;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  PaginatedListview(
      {super.key,
      required this.isLoading,
      required this.itemCount,
      required this.itemBuilder,
      required this.separator,
      required this.onReachLastItem,
      this.shrinkWrap = false,
      this.physics});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (!isLoading) {
          onReachLastItem();
        }
      }
    });

    return ListView.separated(
        shrinkWrap: shrinkWrap,
        physics: physics,
        controller: _scrollController,
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) => separator,
        itemCount: itemCount);
  }
}
