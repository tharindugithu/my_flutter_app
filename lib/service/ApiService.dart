import 'package:dio/dio.dart';
import 'package:my_flutter_app/model/CategoryModel.dart';
import 'package:my_flutter_app/model/Course.dart';
import 'package:my_flutter_app/model/Tutorial.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<T>> fetchData<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      var res = await dio.get("$baseUrl/$endpoint");

      var resData = res.data as List;
      return resData.map((e) => fromJson(e)).toList();
    } on DioError catch (e) {
      print("DioError: $e");

      rethrow;
    } catch (e) {
      print("Error: $e");

      rethrow;
    }
  }

  Future<CategoryModel> fetchCategoryById(String categoryId) async {
    try {
      var res = await dio.get("$baseUrl/category/get_category/$categoryId");

      var resData = res.data as Map<String, dynamic>;
      return CategoryModel.fromJson(resData);
    } on DioError catch (e) {
      print("DioError: $e");

      rethrow;
    } catch (e) {
      print("Error: $e");

      rethrow;
    }
  }

  Future<CourseModel> fetchCourseById(String courseId) async {
    try {
      var res = await dio.get("$baseUrl/course/get_course/$courseId");

      var resData = res.data as Map<String, dynamic>;
      return CourseModel.fromJson(resData);
    } on DioError catch (e) {
      print("DioError: $e");

      rethrow;
    } catch (e) {
      print("Error: $e");

      rethrow;
    }
  }

  Future<TutorialModel> fetchTutorialById(String tutorialId) async {
    try {
      var res = await dio.get("$baseUrl/tutorial/get_tutorial/$tutorialId");

      var resData = res.data as Map<String, dynamic>;
      return TutorialModel.fromJson(resData);
    } on DioError catch (e) {
      print("DioError: $e");

      rethrow;
    } catch (e) {
      print("Error: $e");

      rethrow;
    }
  }
   
   
}
