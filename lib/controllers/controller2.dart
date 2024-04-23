import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
class CartController extends GetxController{

  RxList<CartItem> cart = <CartItem>[].obs;


  add(Product drug){
    for(int i=0 ; i < cart.length ; i++){
      if(cart[i].drug.name == drug.name){
        cart[i].count.value = (cart[i].count.value+1);
        return;
      }
    }
    cart.add(CartItem(drug, 1.obs));
  }
  increase(Product drugs){
    for(int i=0 ; i < cart.length ; i++){
      if(cart[i].drug.name == drugs.name){
        cart[i].count.value = (cart[i].count.value +1);
      }
    }
  }
  decrease(Product drugs){
    for(int i=0 ; i < cart.length ; i++){
      if(cart[i].drug.name == drugs.name){
        if(cart[i].count.value > 1){
          cart[i].count.value = (cart[i].count.value-1);
        }
      }
    }
  }
  delete(Product drugs){
    for(int i=0 ; i < cart.length ; i++){
      if(cart[i].drug.name == drugs.name){
        cart.removeAt(i);
      }
    }
  }

}

class Product {
  final int id;
  final String name;
  final double price;
  Product ( this.id,this.name, this.price, /*this.image,*/);
}

class CartItem {
  Product drug;
  RxInt count;
  CartItem(this.drug, this.count);
}