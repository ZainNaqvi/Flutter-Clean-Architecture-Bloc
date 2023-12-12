import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Row(
                  children: [
                    state.articles![index].urlToImage == ''
                        ? Padding(
                            padding: const EdgeInsetsDirectional.only(end: 14),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: ColoredBox(
                                color: Colors.grey.withOpacity(0.08),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.4,
                                  height: 150,
                                  child: Icon(Icons.image_not_supported),
                                ),
                              ),
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: state.articles![index].urlToImage!,
                            imageBuilder: (context, imageProvider) {
                              return Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 14),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3.6,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.08),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 14),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  child: const CupertinoActivityIndicator(),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, downloadProgress) =>
                                Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 14),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.08),
                                  ),
                                  child: const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(width: 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            state.articles![index].title!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: 200,
                          child: Text(
                            state.articles![index].description!,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: 200,
                          child: Row(
                            children: [
                              const Icon(Icons.published_with_changes_rounded),
                              const SizedBox(width: 8),
                              Text(
                                state.articles![index].publishedAt!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
