import '../model/category_model.dart';

enum Filter {
  category,
  language,
  country,
  sortBy
}

List<String> categoryList = [
  'general','business','entertainment','health',
  'science', 'sports', 'technology'];

Map<String,String> countryMap = {
  'USA': 'us',
  'Canada' : 'ca',
  'France': 'fr',
  'Australia': 'au',
  'Cuba': 'cu',
  'India': 'in',
  'Ireland': 'ie',
  'Indonesia': 'id'
};

Map<String,String> languageMap = {
  'en': 'English',
  'ar':'Arabic',
  'de':'German',
  'es': 'Spanish',
  'fr':'French',
  'he': 'Hebrew',
  'it':'Italian',
  'nl':'Dutch',
  'no': 'Norwegian',
  'pt':'Portuguese',
  'ru': 'Russian',
  'sv':'Swedish',
  'zh':'Chinese'
};

Map<String, String> sortByMap = {
  'Most popular': 'popularity',
  'Newest':'publishedAt'
};

List<CategoryModel> getCategories(){

  List<CategoryModel> categories = <CategoryModel>[];

  CategoryModel categoryModel = CategoryModel();
  categoryModel.categoryName = 'business';
  categoryModel.imageAssetUrl= 'lib/assets/category_business.jpg';
  categories.add(categoryModel);

  CategoryModel categoryModel1 = CategoryModel();
  categoryModel1.categoryName = 'entertainment';
  categoryModel1.imageAssetUrl= 'lib/assets/category_entertainment.jpg';
  categories.add(categoryModel1);

  CategoryModel categoryModel2 = CategoryModel();
  categoryModel2.categoryName = 'general';
  categoryModel2.imageAssetUrl= 'lib/assets/category_general.jpg';
  categories.add(categoryModel2);

  CategoryModel categoryModel3 = CategoryModel();
  categoryModel3.categoryName = 'health';
  categoryModel3.imageAssetUrl= 'lib/assets/category_health.jpg';
  categories.add(categoryModel3);

  CategoryModel categoryModel4 = CategoryModel();
  categoryModel4.categoryName = 'science';
  categoryModel4.imageAssetUrl= 'lib/assets/category_science.jpg';
  categories.add(categoryModel4);

  CategoryModel categoryModel5 = CategoryModel();
  categoryModel5.categoryName = 'sports';
  categoryModel5.imageAssetUrl= 'lib/assets/category_sports.jpg';
  categories.add(categoryModel5);

  CategoryModel categoryModel6 = CategoryModel();
  categoryModel6.categoryName = 'technology';
  categoryModel6.imageAssetUrl= 'lib/assets/category_technology.jpg';
  categories.add(categoryModel6);

  return categories;
}