Future<void> delay(bool addDelay, [int milliseconds = 2000]) {
  if (addDelay) {
    return Future.delayed(Duration(milliseconds: milliseconds));
  } else {
    return Future.value();
  }
}
