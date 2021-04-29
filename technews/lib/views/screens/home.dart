import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technews/constants/api_path.dart';
import '/../views/Widgets/news_card.dart';
import '/../views/components/drawer.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State < HomeScreen >
  with SingleTickerProviderStateMixin {
    /////////////////////GET THE PROBER PATH//////
    // Drawer Animation Controller//////////////////////////
    late AnimationController _animationController;
    @override
    void initState() {
      super.initState();
      _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    }
    _toggleAnimation() {
      _animationController.isDismissed ?
        _animationController.forward() :
        _animationController.reverse();
    }
    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }
    ////////////////////
    @override
    Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      final rightSlide = width * 0.6;
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double slide = rightSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);
          return Stack(
            children: [
              Scaffold(
                backgroundColor: Theme.of(context).primaryColor,
                body: DrawerComponent(),
              ),
              Transform(
                transform: Matrix4.identity()..translate(slide)..scale(scale),
                alignment: Alignment.center,
                child: Scaffold(
                  backgroundColor: Theme.of(context).backgroundColor,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(100),
                    child: Container(
                      color: Theme.of(context).backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 24, 0, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () => _toggleAnimation(),
                                icon: AnimatedIcon(
                                  icon: AnimatedIcons.menu_close,
                                  progress: _animationController,
                                ),
                              ),
                            ],
                          ),
                      ),
                    ),
                  ),
                  body: NewsCard(
                    url: Provider.of < UrlProvider > (context).geturl()
                  ),
                ),
              )
            ],
          );
        },
      );
    }
  }