// // ForgetPasswordController class

import 'package:get/get.dart' as getCont;
import 'package:skiddo_web/services/Api/home/home.dart';
import 'package:skiddo_web/services/user/user_preference.dart';

class HomeController extends getCont.GetxController {
var downlaods =  0.obs;
var Balance = 0.obs;
var totalAmount = 0.obs;
var totalWithDrawn =  0.obs;

HomeEndpoint homeEndpoint = HomeEndpoint();
  @override
  void onInit() async {
 
    getDashboard();
    super.onInit();
  }

   getDashboard() async {
    
     

     String userId =  await UserService.getUserKey();
     Map<String, dynamic>paylaod = {
      "userId": userId
     };

  var  dashboard =    await homeEndpoint.getDashBoardData(paylaod);
  print("hello data is here ");
  print(dashboard);
   downlaods.value = dashboard['totalDownloads'];
   Balance.value = dashboard['balance'];
   totalAmount.value = dashboard['totalAmount'];
   totalWithDrawn.value = dashboard['totalRedrawn'];
     update();
  }
 
}
