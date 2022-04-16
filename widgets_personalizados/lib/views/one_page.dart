
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgets_personalizados/controllers/posts_controller.dart';
import 'package:widgets_personalizados/widgets/custom_buttom_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

  final PostsController _controller = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([_controller.posts, _controller.inLoader]),
              builder: (_, __) => _controller.inLoader.value
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.posts.value.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(_controller.posts.value[index].title),
                      ),
                    ),
            ),
            // ValueListenableBuilder<List<Post>>(
            //   valueListenable: posts,
            //   builder: (_, value, __) => ListView.builder(
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: value.length,
            //     itemBuilder: (_, index) => ListTile(
            //       title: Text(value[index].title),
            //     ),
            //   ),
            //   // builder: (_, value, __) => Text(
            //   //   'Valor é: $value',
            //   //   style: TextStyle(fontSize: 20),
            //   // ),
            // ),
            SizedBox(
              height: 10,
            ),
            CustomButtonWidget(
              disable: false,
              onPressed: () => _controller.callAPI(),
              title: 'Custom BTN',
              titleSize: 18,
            ),
          ],
        ),
      )),
    );
  }
}
