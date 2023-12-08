// Abstract class representing the state of data, which includes either the data or an error.
import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data; // Data received from the API
  final DioError? error; // Error, if any, that occurred during data retrieval

  // Constructor for DataState
  DataState({this.data, this.error});
}

// Subclass representing the state of successful data retrieval.
class DataSuccess<T> extends DataState<T> {
  // Constructor for DataSuccess, inheriting from DataState
  DataSuccess(T data) : super(data: data);
}

// Subclass representing the state when data retrieval has failed.
class DataFailed<T> extends DataState<T> {
  // Constructor for DataFailed, inheriting from DataState
  DataFailed(DioError error) : super(error: error);
}
