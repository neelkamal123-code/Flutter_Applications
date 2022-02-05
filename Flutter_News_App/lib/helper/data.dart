import 'package:Flutter_News_App/models/category_models.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();
  //1
  categoryModel.categoriName = "Business";
  categoryModel.imageUrl =
      'https://media.istockphoto.com/photos/businessman-receive-counseling-from-colleague-it-is-a-picture-of-the-picture-id1271491361?b=1&k=20&m=1271491361&s=170667a&w=0&h=h3GU6-TmUtsqOfqoVpgYpxt3rO-Rx66kWLCOpymW5wI=';

  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoriName = "Entertainment";
  categoryModel.imageUrl =
      'https://media.istockphoto.com/photos/room-modern-minimalist-living-room-with-flat-tv-picture-id1328869733?b=1&k=20&m=1328869733&s=170667a&w=0&h=FkCPS2OUy1_JyAJcklrYaw7WTY_wOn5G1MVI6jZRZ3A=';
  category.add(categoryModel);

  //3
  // categoryModel = new CategoryModel();
  // categoryModel.categoriName = "General";
  // categoryModel.imageUrl =
  //     "https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2VuZXJhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  // category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoriName = "Health";
  categoryModel.imageUrl =
      "https://media.istockphoto.com/photos/patient-care-just-got-a-whole-lot-more-streamlined-picture-id1288871608?b=1&k=20&m=1288871608&s=170667a&w=0&h=65AfPv73VJBe2zEidtW_0iOvPhRyNfesqksdPDRqibg=";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoriName = "Science";
  categoryModel.imageUrl =
      "https://media.istockphoto.com/photos/asian-female-doctor-working-with-pathogen-samples-using-microscope-picture-id1256323051?b=1&k=20&m=1256323051&s=170667a&w=0&h=mrZs1Fzc0yjnus3l0WALeqTgE7SWhdPpBZ4C6gTQ2Wg=";
  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoriName = "Sports";
  categoryModel.imageUrl =
      "https://media.istockphoto.com/photos/basketball-player-slam-dunking-ball-picture-id1254565557?b=1&k=20&m=1254565557&s=170667a&w=0&h=4CVcz-1Y6WMS4DcILPbCNiFEEB55IWmb2v1YWy03xAI=";
  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoriName = "Technology";
  categoryModel.imageUrl =
      "https://media.istockphoto.com/photos/data-scientists-male-programmer-using-laptop-analyzing-and-developing-picture-id1295900106?b=1&k=20&m=1295900106&s=170667a&w=0&h=kQ2UWilU4Bild5aP03CaF65gMbSI-chG--7dd2oS8GM=";
  category.add(categoryModel);

  return category;
}
