class WriteMoney {
  String writedMoney(String price) {
    if ('$price'.length > 2) {
      var value = '$price';
      value = value.replaceAll(RegExp(r'\D'), ' VNĐ');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value + " VNĐ";
    }
    return '';
  }
}
