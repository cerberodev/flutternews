import 'package:flutternews/core/models/category_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> myCategory = List<CategoryModel>();
  CategoryModel categoryModel;

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  myCategory.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl =
      'https://media.socastsrm.com/wordpress/wp-content/blogs.dir/1479/files/2019/02/20170626151914_sports-equipment.jpg';
  myCategory.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80';
  myCategory.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  myCategory.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80';
  myCategory.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl =
      'https://media.socastsrm.com/wordpress/wp-content/blogs.dir/1479/files/2019/02/20170626151914_sports-equipment.jpg';
  myCategory.add(categoryModel);

  return myCategory;
}
