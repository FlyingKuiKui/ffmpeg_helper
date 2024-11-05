import '../../abstract_classes/ffmpeg_filter_abstract.dart';

class OverFilter implements Filter {
  final int offsetX;
  final int offsetY;

  OverFilter({this.offsetX = 0, this.offsetY = 0});

  @override
  String toCli() {
    return "overlay=$offsetX:$offsetY";
  }
}

class OverMoreFilter implements Filter {
  final int index;
  final String firstName;
  final String nextName;
  final int offsetX;
  final int offsetY;
  OverMoreFilter(this.index,
      {this.firstName = "",
      this.nextName = "",
      this.offsetX = 0,
      this.offsetY = 0});

  @override
  String toCli() {
    StringBuffer buffer = StringBuffer();
    if (index == 0) {
      buffer.write("[$index:v]");
    } else {
      buffer.write("[$firstName]");
    }
    buffer.write("[${index + 1}:v]");
    buffer.write(OverFilter(offsetX: offsetX, offsetY: offsetY).toCli());
    if (nextName.isNotEmpty) {
      buffer.write("[$nextName]");
    }
    return buffer.toString();
  }
}
