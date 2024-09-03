import 'package:ads_app/views/promo_detail/promo_detail_page.dart';
import 'package:ads_app/views/widgets/promo_item.dart';
import 'package:flutter/material.dart';

class MyCouponsPage extends StatelessWidget {
  const MyCouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Мои купоны"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Активные",
              ),
              Tab(
                text: "Истёкшие",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildPromoList(
              PromoStatus.active,
              true,
            ),
            buildPromoList(
              PromoStatus.inactive,
              true,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPromoList(
    PromoStatus status,
    bool isMyCoupon,
  ) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return PromoItem(
          status: status,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PromoDetailPage(
                isMyCoupon: isMyCoupon,
              ),
            ));
          },
        );
      },
    );
  }
}
