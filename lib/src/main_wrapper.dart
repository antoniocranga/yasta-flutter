import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthkit_plugin/healthkit_plugin.dart';
import 'package:yasta/src/presentation/onboarding.dart';

import 'bloc/healthkit/healthkit_bloc.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => HealthKitBloc(HealthkitPlugin()))
    ], child: const Onboarding());
  }
}
