class CategoryModel {
  late String name;

}
List < CategoryModel > getCategories() {

  List < CategoryModel > categories = [];
  CategoryModel categoryModel;

  categoryModel = new CategoryModel();
  categoryModel.name = "Business";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.name = "Entertainment";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.name = "General";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.name = "Health";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.name = "Science";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.name = "Sports";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.name = "Technology";

  categories.add(categoryModel);

  return categories;

}