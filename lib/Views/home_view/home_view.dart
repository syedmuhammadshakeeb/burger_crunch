import 'package:burger_crunch/Views/item_view/home_item_view.dart';
import 'package:burger_crunch/controller/iitemcontroller.dart';
import 'package:burger_crunch/res/components/container2.dart';
import 'package:burger_crunch/res/components/conteiner3.dart';
import 'package:burger_crunch/res/components/customcontainer1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchController = TextEditingController();
  final controller = Get.put(ItemData());
  List<String> filtertext = [
    'All',
    'Burgers',
    'Fried Chicken',
    'Fries',
    'Broast',
    'Tikka'
  ];

  List<String> selected = [];
  String search = '';

  @override
  void initState() {
    super.initState();
    // selected = List.generate(filtertext.length, (index) => index == 0);
  }

  @override
  Widget build(BuildContext context) {
    final filterProduct = controller.items.where((product) {
      // return selected.isEmpty || selected.contains(product['category']);
      if (selected.isEmpty || selected.contains('All')) {
        return true; // Show all products if selected is empty or "All"
      } else {
        return selected
            .contains(product['category']); // Filter by category otherwise
      }
    }).toList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff3B3B3B),
              Color(0xff0A0A0A),
              Color(0xff3B3B3B),
            ], end: Alignment.bottomRight, begin: Alignment.topLeft),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                title: Text(
                  'Hello!',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  )),
                ),
                subtitle: Text(
                  'Sana Khan',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  )),
                ),
                trailing: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    height: 20,
                    width: 20,
                    child: const Stack(
                      children: [
                        Center(
                          child: Image(
                            image: AssetImage('assets/icons/bell_icon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 12,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.amber,
                            child: Center(
                                child: Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      'assets/icons/search_icon.png',
                    ),
                    suffixIcon: Image.asset(
                      'assets/icons/menu.png',
                    ),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Color(0xff242424))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Color(0xff242424))),
                    fillColor: Colors.grey.shade800,
                    filled: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      search = value.toString();
                    });
                  },
                ),
              ),
              Container(
                  height: 155,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Expanded(
                      child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const CustomContainer1();
                          }))),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: filtertext.isEmpty
                    ? const Center(
                        child: Text(
                            'No filters available')) // Placeholder for empty list
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: filtertext.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: FilterChip(
                              label: Text(
                                filtertext[index],
                                style: TextStyle(
                                  color: selected.contains(filtertext[index])
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              showCheckmark: false,
                              backgroundColor:
                                  selected.contains(filtertext[index])
                                      ? const Color(0xffD9D9D9)
                                      : Colors.transparent,
                              selectedColor:
                                  selected.contains(filtertext[index])
                                      ? const Color(0xffD9D9D9)
                                      : const Color(0xffD9D9D9),
                              onSelected: (Value) {
                                setState(() {
                                  if (selected.contains(filtertext[index])) {
                                    selected.remove(filtertext[index]);
                                  } else {
                                    selected.clear();
                                    selected.add(filtertext[index]);
                                  }
                                });
                              },
                            ),
                          );
                        },
                      ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: filterProduct.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final products = filterProduct[index];
                    String position = controller.items[index]["name"];
                    String uniqueTag =
                        'tag-$index'; // It's better to make this unique for each item
                    if (searchController.text.isEmpty &&
                        filtertext.contains('All')) {
                      return InkWell(
                        onTap: () {
                          // Check if the favourateList is not empty and the index is valid
                          if (controller.favourateList.isNotEmpty &&
                              index < controller.favourateList.length) {
                            Get.to(HomeItemView(
                              ontap: () {
                                setState(() {
                                  controller.addToCart
                                      .add(controller.items[index]);
                                  print('--------->>${controller.addToCart}');
                                });
                              },
                              price: products['price'].toString() ?? '',
                              name: products['name'],
                              fav: products['isfav'],
                              tag: uniqueTag,
                              image: const AssetImage(
                                  'assets/images/big_burger.png'),
                            ));
                          } else {
                            // Ensure the index is valid for items list as well
                            if (index < controller.items.length) {
                              Get.to(HomeItemView(
                                ontap: () {
                                  setState(() {
                                    controller.addToCart
                                        .add(controller.items[index]);
                                    print('--------->>${controller.addToCart}');
                                  });
                                },
                                price: products['price'].toString() ?? '',
                                name: products['name'],
                                tag: uniqueTag,
                                image: AssetImage('${products['image']}'),
                              ));
                            }
                          }
                        },
                        child: Hero(
                          tag: uniqueTag,
                          child: Container2(
                            gradient: products['color'],
                            favourite: InkWell(
                              onTap: () {
                                setState(() {
                                  if (products['isfav']) {
                                    controller.items[index]['isfav'] = false;
                                    controller.favourateList
                                        .remove(controller.items[index]);
                                    print(controller.favourateList);
                                  } else {
                                    products['isfav'] = true;
                                    controller.favourateList
                                        .add(controller.items[index]);
                                    print(controller.favourateList);
                                  }
                                });
                              },
                              child: products['isfav'] == true
                                  ? const Icon(
                                      Icons.favorite,
                                      size: 16.61,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border_outlined,
                                      size: 16.61,
                                      color: Colors.black,
                                    ),
                            ),
                            image: products['image'],
                            text: products['name'],
                            price: products['price'].toString(),
                            rating: products['rating'],
                          ),
                        ),
                      );
                    } else if (position
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase())) {
                      return InkWell(
                        onTap: () {
                          // Check if the favourateList is not empty and the index is valid
                          if (controller.favourateList.isNotEmpty &&
                              index < controller.favourateList.length) {
                            Get.to(HomeItemView(
                              ontap: () {
                                setState(() {
                                  controller.addToCart
                                      .add(controller.items[index]);
                                  print('--------->>${controller.addToCart}');
                                });
                              },
                              price:
                                  controller.items[index]['price'].toString() ??
                                      '',
                              name: position,
                              fav: controller.favourateList[index]['isfav'],
                              tag: uniqueTag,
                              image: const AssetImage(
                                  'assets/images/big_burger.png'),
                            ));
                          } else {
                            // Ensure the index is valid for items list as well
                            if (index < controller.items.length) {
                              Get.to(HomeItemView(
                                ontap: () {
                                  setState(() {
                                    controller.addToCart
                                        .add(controller.items[index]);
                                    print('--------->>${controller.addToCart}');
                                  });
                                },
                                price: controller.items[index]['price']
                                        .toString() ??
                                    '',
                                name: position,
                                tag: uniqueTag,
                                image: AssetImage(
                                    '${controller.items[index]['image']}'),
                              ));
                            }
                          }
                        },
                        child: Hero(
                          tag: uniqueTag,
                          child: Container2(
                            gradient: controller.items[index]['color'],
                            favourite: InkWell(
                              onTap: () {
                                setState(() {
                                  if (controller.items[index]['isfav']) {
                                    controller.items[index]['isfav'] = false;
                                    controller.favourateList
                                        .remove(controller.items[index]);
                                    print(controller.favourateList);
                                  } else {
                                    controller.items[index]['isfav'] = true;
                                    controller.favourateList
                                        .add(controller.items[index]);
                                    print(controller.favourateList);
                                  }
                                });
                              },
                              child: controller.items[index]['isfav'] == true
                                  ? const Icon(
                                      Icons.favorite,
                                      size: 16.61,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border_outlined,
                                      size: 16.61,
                                      color: Colors.black,
                                    ),
                            ),
                            image: controller.items[index]['image'],
                            text: position,
                            price: controller.items[index]['price'].toString(),
                            rating: controller.items[index]['rating'],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Super Meals',
                      style: GoogleFonts.paytoneOne(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ),
                    Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          'See All',
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container3(
                text1: '4.8 rating',
                text: 'The Great Stacker Deal',
                image: const AssetImage('assets/images/bigimage1.png'),
              ),
              Container3(
                  text1: '5.0 rating',
                  text: 'Chapli Fans Offer',
                  image: const AssetImage('assets/images/bigimage2.png')),
            ],
          ),
        ),
      ),
    );
  }
}
