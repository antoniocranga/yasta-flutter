import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yasta/src/bloc/healthkit/healthkit_event.dart';

import '../bloc/healthkit/healthkit_bloc.dart';
import '../bloc/healthkit/healthkit_state.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    context.read<HealthKitBloc>().add(RequestAuthorization());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: BlocConsumer<HealthKitBloc, HealthKitState>(
                listener: (context, state) {
      if (state is HealthKitAuthorizationFailed) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
    }, builder: (context, state) {
      if (state is HealthKitInitial) {
        return ElevatedButton(
            onPressed: () {
              context.read<HealthKitBloc>().add(RequestAuthorization());
            },
            child: Text('Request HealthKit Authorization'));
      } else if (state is HealthKitLoading) {
        return CircularProgressIndicator();
      } else if (state is HealthKitAuthorized) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Healthkit authorized"),
            ElevatedButton(
                onPressed: () {
                  context.read<HealthKitBloc>().add(QuerySteps(4));
                },
                child: Text("Query steps"))
          ],
        );
      } else if (state is HealthKitQuerySuccess) {
        return Text(state.steps.toString());
      } else if (state is HealthKitQueryFailed) {
        return Text(state.message);
      } else {
        return Text('Authorization failed');
      }
    })));
  }
}
