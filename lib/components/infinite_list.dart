import 'package:flutter/material.dart';

import 'loading_circul.dart';

typedef FetchDataFunc = void Function(int lastkey, int limit);
typedef ListViewBuilder = Widget Function(BuildContext context, int index);

class InfiniteList extends StatefulWidget {
  final int itemLength;
  final EdgeInsetsGeometry? padding;
  final FetchDataFunc fetchData;
  final int maxSize;
  final int limit;
  final ListViewBuilder listViewFunc;

  const InfiniteList(
      {Key? key,
      required this.itemLength,
      this.padding,
      required this.fetchData,
      this.maxSize = 65535,
      this.limit = 0,
      required this.listViewFunc})
      : super(key: key);

  @override
  _InfiniteListState createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.itemLength,
        padding: widget.padding ?? const EdgeInsets.only(top: 10),
        itemBuilder: (BuildContext context, int index) {
          if (index == widget.itemLength - 1) {
            if (widget.itemLength < widget.maxSize) {
              widget.fetchData(widget.itemLength, widget.limit);
              return const LoadingRound();
            } else {
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text('到底啦~'),
              );
            }
          }
          return widget.listViewFunc(context, index);
        });
  }
}
