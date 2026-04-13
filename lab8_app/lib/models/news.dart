import 'package:intl/intl.dart';

class News {
  final String id;
  final String activeFrom;
  final String title;
  final String previewText;
  final String previewPictureSrc;
  final String detailPageUrl;
  final String detailText;

  const News({
    required this.id,
    required this.activeFrom,
    required this.title,
    required this.previewText,
    required this.previewPictureSrc,
    required this.detailPageUrl,
    required this.detailText,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['ID'] as String,
      activeFrom: json['ACTIVE_FROM'] as String,
      title: Bidi.stripHtmlIfNeeded(json['TITLE'] as String? ?? ''),
      previewText: Bidi.stripHtmlIfNeeded(json['PREVIEW_TEXT'] as String? ?? ''),
      previewPictureSrc: json['PREVIEW_PICTURE_SRC'] as String? ?? '',
      detailPageUrl: json['DETAIL_PAGE_URL'] as String? ?? '',
      detailText: Bidi.stripHtmlIfNeeded(json['DETAIL_TEXT'] as String? ?? ''),
    );
  }
}