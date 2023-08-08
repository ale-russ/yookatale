import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yookatale/features/common/widgets/base_widget.dart';
import 'package:yookatale/features/common/widgets/custom_button.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseWidget(
        child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          const Text(
            'Access your Account',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          const Text(
            'Sign In to Continue',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            color: Theme.of(context).primaryColor,
            width: 100,
            height: 2,
          ),
          Container(
            // height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 40,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'email is required',
                      focusColor: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 40,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'password is required',
                      focusColor: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Create new account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color.fromRGBO(24, 95, 45, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  onPressed: () {},
                  title: 'Sign In',
                  width: 100,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
