import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticle();

  // Database methods
  Future<List<ArticleEntity>> getSavedAticles();
  Future<void> saveAticles(ArticleEntity articleEntity);
  Future<void> removeAticles(ArticleEntity articleEntity);
}
