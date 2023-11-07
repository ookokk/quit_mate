import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quit_mate/src/core/theme/theme_provider.dart';
import 'package:quit_mate/src/product/user/model/sober_user.dart';
import 'package:quit_mate/src/product/user/repository/user_repository.dart';

class Deneme extends ConsumerWidget {
  const Deneme({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    StreamController<Map<String, double>> dataStreamController =
        StreamController<Map<String, double>>();
    final UserRepository userRepository = UserRepository();
    const String userId = "user1234";
    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.scaffoldBackgroundColor,
        body: SizedBox(
          height: 500,
          child: StreamBuilder<Map<String, double>>(
            stream: dataStreamController.stream,
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (data == null) {
                return const CircularProgressIndicator();
              }
              final currentSecond = data['second'] ?? 0.0;
              final currentMinute = data['minute'] ?? 0.0;
              final currentHour = data['hour'] ?? 0.0;
              final currentDay = data['day'] ?? 0.0;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        print(currentSecond);
                        print(currentMinute);
                        print(currentHour);
                        print(currentDay);
                      },
                      icon: const Icon(Icons.plus_one_outlined),
                    ),
                    IconButton(
                      onPressed: () async {
                        final user = SoberUser(
                          addictiveFactor: "weed",
                          soberStartDate: DateTime.now(),
                          weeklyUse: 3,
                          dailyUseOnDays: 2,
                          pledgeTime: const TimeOfDay(hour: 5, minute: 2),
                          reviewTime: const TimeOfDay(hour: 2, minute: 2),
                        );
                        await userRepository.saveUser(userId, user);
                        print("Kullanıcı verileri kaydedildi.");
                      },
                      icon: Text(
                        'Set',
                        style: currentTheme.textTheme.bodyLarge,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final retrievedUser =
                            await userRepository.getUser(userId);
                        if (retrievedUser != null) {
                          print(
                              "Kullanıcı verileri alındı: ${retrievedUser.toJson()}");
                        } else {
                          print("Kullanıcı bulunamadı.");
                        }
                      },
                      icon: Text(
                        'Get',
                        style: currentTheme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
