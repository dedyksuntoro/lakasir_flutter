import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lakasir/api/responses/auths/profile_response.dart';
import 'package:lakasir/api/responses/members/member_response.dart';
import 'package:lakasir/api/responses/payment_methods/payment_method_response.dart';
import 'package:lakasir/api/responses/products/product_response.dart';
import 'package:lakasir/api/responses/transactions/history_response.dart';
import 'package:lakasir/api/responses/transactions/selling_detail.dart';
import 'package:lakasir/screens/setting/printers/add_printer_page_screen.dart';
import 'package:lakasir/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

String formatPrice(dynamic price, {bool isSymbol = true}) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: isSymbol ? 'Rp. ' : '',
    decimalDigits: 0,
  ).format(price);
}

Future<Locale> getLocale() async {
  final prefs = await SharedPreferences.getInstance();

  return Locale(prefs.getString('locale') ??
      Locale(Get.deviceLocale!.toString()).languageCode);
}

Future<void> setLocale(String locale) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('locale', locale);
}

Future<String> getLanguageCode() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('locale') ?? Get.deviceLocale!.toString();
}

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

Future show(
  String message, {
  Duration duration = const Duration(seconds: 2),
  Color? color,
}) async {
  Get.rawSnackbar(
    message: message,
    duration: duration,
    backgroundColor: color ?? success,
  );
}

void printExampleReceipt(BlueThermalPrinter bluetooth) {
  PrintReceipt(bluetooth: bluetooth).print(
    TransactionHistoryResponse(
      id: 1,
      userId: 1,
      cashier: ProfileResponse(
        name: 'Cashier name',
        email: 'cashier@mail.com',
      ),
      friendPrice: false,
      paymentMethodId: 1,
      totalPrice: 375000,
      tax: 25,
      member: MemberResponse(id: 1, name: 'member_name'.tr),
      paymentMethod: PaymentMethodRespone(id: 1, name: "Cash"),
      payedMoney: 400000,
      moneyChange: 25000,
      sellingDetails: [
        SellingDetail(
          quantity: 3,
          price: 75000,
          productId: 1,
          sellingId: 1,
          id: 0,
          product: ProductResponse(
            name: 'product_name'.tr,
            sellingPrice: 25000,
          ),
        ),
        SellingDetail(
          quantity: 3,
          price: 75000,
          productId: 1,
          sellingId: 1,
          id: 0,
          product: ProductResponse(
            name: 'product_name'.tr,
            sellingPrice: 25000,
          ),
        ),
        SellingDetail(
          quantity: 3,
          price: 75000,
          productId: 1,
          sellingId: 1,
          id: 0,
          product: ProductResponse(
            name: 'product_name'.tr,
            sellingPrice: 25000,
          ),
        ),
        SellingDetail(
          quantity: 3,
          price: 75000,
          productId: 1,
          sellingId: 1,
          id: 0,
          product: ProductResponse(
            name: 'product_name'.tr,
            sellingPrice: 25000,
          ),
        ),
        SellingDetail(
          quantity: 3,
          price: 75000,
          productId: 1,
          sellingId: 1,
          id: 0,
          product: ProductResponse(
            name: 'product_name'.tr,
            sellingPrice: 25000,
          ),
        ),
      ],
    ),
  );
}
