// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Biv Manager';

  @override
  String get settings => 'Cài đặt';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get textDirection => 'Hướng văn bản';

  @override
  String get leftToRight => 'Trái sang phải';

  @override
  String get rightToLeft => 'Phải sang trái';

  @override
  String get loading => 'Đang tải...';

  @override
  String get error => 'Lỗi';

  @override
  String get success => 'Thành công';

  @override
  String get cancel => 'Hủy';

  @override
  String get save => 'Lưu';

  @override
  String get delete => 'Xóa';

  @override
  String get edit => 'Sửa';

  @override
  String get theme => 'Giao diện';

  @override
  String get about => 'Giới thiệu';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get transactionDetails => 'Chi tiết giao dịch';

  @override
  String get loadingTransactionDetails => 'Đang tải chi tiết giao dịch...';

  @override
  String get amount => 'Số tiền';

  @override
  String get date => 'Ngày';

  @override
  String get status => 'Trạng thái';

  @override
  String get description => 'Mô tả';

  @override
  String get failedToLoadTransactionDetails =>
      'Không thể tải chi tiết giao dịch';

  @override
  String get retry => 'Thử lại';

  @override
  String get details => 'Chi tiết';

  @override
  String get category => 'Danh mục';
}
