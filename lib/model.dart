class Model {
  Stream<int> login(dynamic data) =>
      Stream.fromFuture(Future.delayed(Duration(seconds: 3), () {
        if (data["username"] == "hasan" && data["password"] == "123") return 0;

        return -1;
      }));
}
