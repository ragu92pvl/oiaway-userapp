

class OrderRequest {
  String? uid;
  String? vendorId;
  String? productId;
  String? addressId;
  String? oTotal;
  String? subTotal;
  String? tax;
  String? discount;
  String? transId;

  OrderRequest(
      {this.uid, this.vendorId, this.productId, this.addressId, this.transId,this.oTotal,this.subTotal,this.tax,this.discount});

  OrderRequest.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    vendorId = json['vendor_id'];
    productId = json['product_id'];
    addressId = json['address_id'];
    transId = json['trans_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['vendor_id'] = this.vendorId;
    data['product_id'] = this.productId;
    data['address_id'] = this.addressId;
    data['trans_id'] = this.transId;
    data['ototal'] = this.oTotal;
    data['subtotal'] = this.subTotal;
    data['tax'] = this.tax;
    data['discount'] = this.discount;
    return data;
  }
}
