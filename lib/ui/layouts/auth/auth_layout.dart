import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Scrollbar(
      child: ListView(
        children: [
          size.width > 1000
              ?
              //Descktop
              _DecktopBody(
                  child: child,
                )
              :
              //Mobiles
              _MobileBody(
                  child: child,
                ),
          //LinksBar
          const LinksBar(),
        ],
      ),
    ));
  }
}

class _DecktopBody extends StatelessWidget {
  final Widget child;

  const _DecktopBody({required this.child});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width,
      height: size.height * 0.9,
      color: Colors.red,
      child: Row(
        children: [
          //TwitterBackground
          const BackgroundTwitter(),
          //viewcontainer
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(height: 50),
                Expanded(child: child)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          const SizedBox(
            height: 400,
            width: double.infinity,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}
