import 'package:fitness/model/category_model.dart';
import 'package:fitness/model/diet_model.dart';
import 'package:fitness/widgets/button_widget.dart';
import 'package:fitness/widgets/dialog_box.dart';
import 'package:fitness/widgets/diet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _levelController = TextEditingController();
  final _calorieController = TextEditingController();
  final _durationController = TextEditingController();
  final _dishController = TextEditingController();

  List<CategoryModel> categories = [];
  List<DietModel> diet = [];
  List<DietModel> newDiet = [];

  void _getCategories() {
    categories = CategoryModel.getCategoryList();
  }

  void _getDietList() {
    diet = DietModel.getDietList();
  }

  void saveNewDish() {
    setState(() {
      newDiet.add(DietModel(
          name: _dishController.text,
          iconPath: "assets/icons/blueberry-pancake.svg",
          duration: _durationController.text,
          calorie: _calorieController.text,
          level: _levelController.text,
          isViewSelected: false));
      _dishController.clear();
      _calorieController.clear();
      _levelController.clear();
      _durationController.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AddNewTaskDialog(
            levelController: _levelController,
            calorieController: _calorieController,
            dishController: _dishController,
            durationController: _durationController,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewDish,
          );
        });
  }

  // @override
  // void initState() {
  //   _getCategories();
  //   _getDietList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getDietList();
    return Scaffold(
        appBar: fitnessAppBar(),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: () => createNewTask()),
        body: ListView(
          children: [
            _searchTextField(),
            const SizedBox(
              height: 20,
            ),
            _categoriesSection(),
            const SizedBox(
              height: 20,
            ),
            _dietSection(),
            const SizedBox(
              height: 20,
            ),
            _popularSection(),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "New Dish",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  newDiet.isEmpty
                      ? Container(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/ic_empty.png",
                              ),
                              const Text(
                                "No New Dish has been added",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyButton(
                                  text: "Add New Dish",
                                  onPressed: () => createNewTask())
                            ],
                          ),
                        )
                      : DietWidget(
                          diet: newDiet,
                          itemCount: newDiet.length,
                        )
                ],
              ),
            )
          ],
        ));
  }

  Container _popularSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Popular",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          DietWidget(
            diet: diet,
            itemCount: diet.length,
          ),
        ],
      ),
    );
  }

  Container _dietSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recommendation \nfor Diet",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 240,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.blue.withOpacity(0.11)
                            : Colors.green.withOpacity(0.11),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(diet[index].iconPath),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              diet[index].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${diet[index].level} | ${diet[index].duration} | ${diet[index].calorie}",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        Container(
                          width: 130,
                          height: 45,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                diet[index].isViewSelected
                                    ? Colors.transparent
                                    : Colors.blue.withOpacity(0.2),
                                diet[index].isViewSelected
                                    ? Colors.transparent
                                    : Colors.blue.withOpacity(0.8)
                              ]),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            "view",
                            style: TextStyle(
                                color: diet[index].isViewSelected
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
                itemCount: diet.length),
          )
        ],
      ),
    );
  }

  Container _categoriesSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Category",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    decoration: BoxDecoration(
                        color: categories[index].boxColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(categories[index].name)
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Container _searchTextField() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            filled: true,
            hintText: "Type your breakfast",
            fillColor: Colors.white,
            prefixIcon: Container(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset("assets/icons/Search.svg")),
            suffixIcon: Container(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset("assets/icons/Filter.svg")),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }

  AppBar fitnessAppBar() {
    return AppBar(
      elevation: 0.0,
      title: const Text(
        "Breakfast",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          print("Back button is clicked");
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print("Settings is clicked");
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
