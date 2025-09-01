import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Theme/app_colors.dart';
import 'package:flutter_application_1/core/constatnts/app_assets.dart';
import 'package:flutter_application_1/models/category_data.dart';
import 'package:flutter_application_1/modeules/splash/screens/layout/home/widgets/event_item_widget.dart';
import 'package:flutter_application_1/modeules/splash/screens/layout/home/widgets/tap_item_widget.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});
  static const String route = '/homepage';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentTabIndex = 0;
  List<CategoryData> categories = [
    CategoryData(categoryTitle: "Sports", categoryImg: "", categoryIcn: ""),
    CategoryData(categoryTitle: "Birthday", categoryImg: "", categoryIcn: ""),
    CategoryData(categoryTitle: "Book Club", categoryImg: "", categoryIcn: ""),
    CategoryData(categoryTitle: "Gaming", categoryImg: "", categoryIcn: ""),
    CategoryData(categoryTitle: "Meeting", categoryImg: "", categoryIcn: ""),
    CategoryData(categoryTitle: "WorkShop", categoryImg: "", categoryIcn: ""),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الجزء الفوق
          Container(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 10,
              right: 16,
              left: 16,
            ),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row مع الكلام والآيكونات
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back ✨",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Eslam Saleh",
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage(AppAssets.mapsIcn),
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Cairo, Egypt",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "EN",
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // الـ TabBar
                DefaultTabController(
                  length: categories.length,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: TabBar(
                      padding: EdgeInsets.zero,
                      isScrollable: true,
                      indicatorPadding: EdgeInsets.zero,
                      tabAlignment: TabAlignment.start,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                      indicator: const BoxDecoration(),
                      dividerColor: Colors.transparent,
                      onTap: (index) {
                        setState(() {
                          currentTabIndex = index;
                        });
                      },
                      tabs:
                          categories.map((categoryData) {
                            return TapItemWidget(
                              isSelected:
                                  currentTabIndex ==
                                  categories.indexOf(categoryData),
                              categoryData: categoryData,
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // الجزء اللي بياخد باقي الشاشة
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return EventItemWidget(
                  
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 15);
              },
            ),
          ),
        ],
      ),
    );
  }
}
