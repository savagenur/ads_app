// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum PromoStatus {
  active,
  inactive,
}

class PromoItem extends StatelessWidget {
  final VoidCallback? onTap;
  final PromoStatus status;
  const PromoItem({
    Key? key,
    this.onTap,
    this.status = PromoStatus.active,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActive = status == PromoStatus.active;
    return ListTile(
      title: Text(
        "Promotion to KFC wings!",
      ),
      tileColor: isActive ? null : Colors.grey[300],
      subtitle: Text(
        "Only today, try and you never regret about what happened!",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      shape: LinearBorder.bottom(side: BorderSide(color: Colors.grey)),
      onTap: onTap,
      trailing: CachedNetworkImage(
        imageUrl: "https://welovechicken.caterkfc.com/img/coupon-02.png",
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
