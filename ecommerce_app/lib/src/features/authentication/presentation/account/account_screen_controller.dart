import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/utils/void_async_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreenController extends StateNotifier<VoidAsyncValue> {
  AccountScreenController({required this.authRepository})
      : super(const VoidAsyncValue.data(null));
  final FakeAuthRepository authRepository;

  Future<bool> signOut() async {
    try {
      state = const VoidAsyncValue.loading();
      await authRepository.signOut();
      state = const VoidAsyncValue.data(null);
      return true;
    } catch (e) {
      state = VoidAsyncValue.error(e);
      return false;
    }
  }
}

final accountScreenControllerProvider =
    StateNotifierProvider.autoDispose<AccountScreenController, VoidAsyncValue>(
        (ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(authRepository: authRepository);
});
