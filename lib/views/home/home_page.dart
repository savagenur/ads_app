import 'package:ads_app/app/dimension/design_dimension.dart';
import 'package:ads_app/core/extensions/to_build_context_extension.dart';
import 'package:ads_app/views/promo_detail/promo_detail_page.dart';
import 'package:ads_app/views/widgets/promo_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const categoryList = [
  "Все",
  "Рестораны",
  "Кинотеатры",
  "Магазины",
  "Магазины",
  "Магазины",
  "Магазины",
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _categoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DDimens.biggerPadding.verticalBox,
          buildAppBar(),
          Divider(),
          buildCategoryList(),
          DDimens.bigPadding.verticalBox,
          buildPromoList()
        ],
      ),
    );
  }

  Row buildAppBar() {
    return Row(
      children: [
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: "Баланс: ",
                  style: context.textTheme.headlineSmall,
                  children: [
                    TextSpan(
                      text: "100 сом",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categoryList.length,
          (index) {
            return buildCategoryItem(index);
          },
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    bool selected = _categoryIndex == index;
    final categoryName = categoryList[index];
    return Padding(
      padding: DDimens.bigPadding.left,
      child: InkWell(
        borderRadius: DDimens.mediumPadding.radius,
        onTap: () {
          setState(() {
            _categoryIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 300,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: DDimens.biggerPadding,
            vertical: DDimens.smallPadding,
          ),
          decoration: BoxDecoration(
            color: selected ? Colors.green : null,
            border: Border.all(
              color: selected ? Colors.grey : Colors.black,
            ),
            borderRadius: DDimens.mediumPadding.radius,
          ),
          child: Text(
            categoryName,
            style: context.textTheme.titleMedium!.copyWith(
              color: selected ? Colors.white : null,
              fontWeight: selected ? FontWeight.bold : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPromoList() {
    return Expanded(
        child: ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return PromoItem(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PromoDetailPage(),
              )),
        );
      },
    ));
  }
}


