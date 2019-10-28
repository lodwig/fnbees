class ServiceWorkers {
  Future<bool> doLogin() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
