Future<void> delay(bool addDelay, [int milliseconds = 2000]) async {
  if (addDelay) {
    // This has been observed to cause this error when signIn(tester) was called in the widget tests:
    //
    // A Timer is still pending even after the widget tree was disposed.
    await Future.delayed(Duration(milliseconds: milliseconds));
  } else {
    return Future.value();
  }
}
