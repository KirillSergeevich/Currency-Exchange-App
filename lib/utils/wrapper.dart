class Wrapper<T> {
  final T? data;
  final int status;

  Wrapper({this.data, this.status = 200});

  bool success() {
    return status >= 200 && status < 400;
  }
}
