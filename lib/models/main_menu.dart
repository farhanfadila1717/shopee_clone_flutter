import 'package:shopee_clone/shared/assets_path.dart';

class MainMenu {
  final String iconPath;
  final String title;

  const MainMenu(this.iconPath, this.title);
}

List<MainMenu> dummyMainMenu = [
  MainMenu(AssetsPath.icMall, "Shopee Mal"),
  MainMenu(AssetsPath.icXtra, "Gratis Ongkir Extra"),
  MainMenu(AssetsPath.icPulsa, "Pulsa, Tagihan & Hiburan"),
  MainMenu(AssetsPath.icRp, "Cashback & Voucher"),
  MainMenu(AssetsPath.icRpSatu, "ShopeePay Deals Rp1"),
  MainMenu(AssetsPath.icCod, "Bayar Di Tempat"),
  MainMenu(AssetsPath.icBeauty, "Beauty Brand Favorit"),
  MainMenu(AssetsPath.icVideo, "Shopee Video"),
  MainMenu(AssetsPath.icBulan, "Shopee Barokah"),
  MainMenu(AssetsPath.icSemua, "Semua 5RB"),
  MainMenu(AssetsPath.icDiskon, "Pasti Diskon 50%"),
  MainMenu(AssetsPath.icSerba, "Serba 10 Ribu"),
];
