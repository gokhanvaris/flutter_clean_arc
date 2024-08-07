import 'package:flutter/material.dart';
import 'package:flutter_clean_arc/product/core/cache/cache_manager.dart';
import 'package:flutter_clean_arc/product/utility/models/res/user_model.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final CacheManager<User> _cacheManager = GetIt.I<CacheManager<User>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final cachedUser = await _cacheManager.getCachedData(
                      'user_1', (bytes) => User.fromBytes(bytes));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text(cachedUser?.name.toString() ?? 'No User')),
                  );
                },
                child: Text('READ FROM CACHE')),
            ElevatedButton(
                onPressed: () async {
                  final user = User(
                      id: 1, name: 'John Doe', email: 'john.doe@example.com');
                  await _cacheManager.cacheData('user_${user.id}', user);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User cached')),
                  );
                },
                child: Text('CACHE')),
          ],
        ),
      ),
    );
  }
}
