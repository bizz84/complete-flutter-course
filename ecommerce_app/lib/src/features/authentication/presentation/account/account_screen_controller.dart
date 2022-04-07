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
    return !state.hasError;
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
