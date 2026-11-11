bool challengeCountsProduct(String challengeId, String productName) {
  final name = productName.toLowerCase();
  if (challengeId.startsWith('c_coco')) {
    return name.contains('coco');
  }
  if (challengeId == 'c_coffee') {
    return name.contains('americano') || name.contains('coffee');
  }
  return false;
}
