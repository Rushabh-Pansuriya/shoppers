import 'package:get/get.dart';

class ProductController extends GetxController {
  RxInt selectedIndex = 1.obs;
  var cartItems = {};

  List productImage = [
    'https://images.ctfassets.net/371ugtyffwio/44jlsBMUobOggRYyko9Ody/547f589e0309e446fbf06a02db4ce9a5/Hero_M1_hero_whiteshirt.jpg',
    'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/8889611/2019/3/20/3eae8fb4-b7ca-4e01-80bf-d1e59ab1568d1553080254589-Roadster-Men-Black--White-Regular-Fit-Checked-Casual-Shirt-9-1.jpg',
    'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/44-alum-blue-sport-deepnavy-6s-nc?wid=2000&hei=2000&fmt=jpeg&qlt=95&.v=1599811389000',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2Zkm94Q9ACe1Emq5w5rMSGLUF4CtPYLCQtg&usqp=CAU',
    'https://assets.ajio.com/medias/sys_master/root/20210403/4Zeb/606863a67cdb8c1f1474dd0b/-1117Wx1400H-461085141-blue-MODEL.jpg'
  ];
  List productName = [
    "Men's Shirt",
    "Men's Trouser",
    'Apple Watch',
    "Men's Shoes",
    "Men-s T-Shirt"
  ];
  List productDesc = [
    'Premium white casual shirt',
    'Black slim fit Trouser',
    'Branded Apple watch',
    'Red shoes for casual wear',
    'Lining T-shirt Navy Blue'
  ];
  List productPrice = ['5.65', '2.15', '550', '10.5', '14.85'];
}

