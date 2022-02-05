
import 'package:wallpaper_app/models/categories_model.dart';

const String ApiKey = "563492ad6f91700001000001900a29dd68534df2abea633536115f25";
List<CategoriesModel> getCategories(){
  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = new CategoriesModel();
  //1
  categoriesModel.categoryName = "Street Art";
  categoriesModel.imgUrl = "https://images.pexels.com/photos/2119706/pexels-photo-2119706.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  //2
  categoriesModel.categoryName="Wild Life";
  categoriesModel.imgUrl="https://images.pexels.com/photos/833020/pexels-photo-833020.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  //3
  categoriesModel.categoryName="Nature";
  categoriesModel.imgUrl="https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  //4
  categoriesModel.categoryName="Mountains";
  categoriesModel.imgUrl="https://images.pexels.com/photos/9754/mountains-clouds-forest-fog.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  //5
  categoriesModel.categoryName="Zoo";
  categoriesModel.imgUrl="https://images.pexels.com/photos/1040396/pexels-photo-1040396.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  //6
  categoriesModel.categoryName="Sky";
  categoriesModel.imgUrl="https://images.pexels.com/photos/2531709/pexels-photo-2531709.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  //7
  categoriesModel.categoryName="Cars";
  categoriesModel.imgUrl="https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoriesModel);

  categoriesModel = new CategoriesModel();
  //8
  categoriesModel.categoryName="Joy";
  categoriesModel.imgUrl="https://images.pexels.com/photos/1263986/pexels-photo-1263986.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categoriesModel);
  return categories;

}