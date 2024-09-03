import 'package:ads_app/app/dimension/design_dimension.dart';
import 'package:ads_app/core/extensions/to_build_context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PromoDetailPage extends StatelessWidget {
  final bool isMyCoupon;
  const PromoDetailPage({
    super.key,
    this.isMyCoupon = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: DDimens.mediumPadding.all,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: DDimens.bigPadding.radius,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://welovechicken.caterkfc.com/img/coupon-02.png",
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).width * .8,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  if (isMyCoupon)
                    Positioned(
                      bottom: DDimens.bigPadding,
                      right: DDimens.bigPadding,
                      child: IconButton(
                        style:
                            IconButton.styleFrom(backgroundColor: Colors.green),
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Padding(
                                  padding: DDimens.bigPadding.all,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      QrImageView(
                                        data:
                                            "https://pub.dev/packages/qr_flutter",
                                      ),
                                      Text(
                                          "https://pub.dev/packages/qr_flutter"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.qr_code_2_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              DDimens.mediumPadding.verticalBox,
              Text(
                "Promo of KFC",
                style: context.textTheme.titleLarge,
              ),
              Text(
                "Description Description Description Description Description Description Description Description Description Description Description ",
                style: context.textTheme.bodyLarge,
              ),
              DDimens.mediumPadding.verticalBox,
              Divider(),
              DDimens.mediumPadding.verticalBox,
              Text(
                "Rules:",
                style: context.textTheme.titleLarge,
              ),
              Text(
                "Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description Description ",
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: DDimens.mediumPadding.all,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {},
            child: Text("Играть", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
