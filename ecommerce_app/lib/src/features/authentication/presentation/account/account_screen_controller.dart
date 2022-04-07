import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/utils/void_async_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreenController extends StateNotifier<VoidAsyncValue> {
  AccountScreenController({required this.authRepository})
      : super(const VoidAsyncValue.data(null));
  final FakeAuthRepository authRepository;

  Future<bool> signOut() async {
    state = const VoidAsyncValue.loading();
    state = await VoidAsyncValue.guard(() => authRepository.signOut());
    final success = !state.hasError;
    // Reset state back to data (which is the default state)
    state = const VoidAsyncValue.data(null);
    return success;
    // try {
    //   state = const VoidAsyncValue.loading();
    //   await authRepository.signOut();
    //   return true;
    // } catch (e) {
    //   state = VoidAsyncValue.error(e);
    //   return false;
    // } finally {
    //   state = const VoidAsyncValue.data(null);
    // }
  }
}

final accountScreenControllerProvider =
    StateNotifierProvider.autoDispose<AccountScreenController, VoidAsyncValue>(
        (ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(
    authRepository: authRepository,
  );
});
