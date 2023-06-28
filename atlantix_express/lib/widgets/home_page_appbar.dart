import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageAppBar extends StatefulWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {

  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _isScrolled =
            _scrollController.offset > 100; // Change the offset value as needed
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              elevation: 0,
              expandedHeight: MediaQuery.of(context).size.height * .7,
              backgroundColor: _isScrolled ? Colors.blue : Colors.transparent,
              pinned: true,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.transparent,
                  ),
                  titlePadding: EdgeInsets.all(0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _isScrolled
                          ? Center(
                        child: Text(
                          'Recent Activity',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                          : Text(
                        'Recent Activity',
                        style: TextStyle(
                            color: Color(0xFF141D73), fontSize: 12),
                      ),
                      _isScrolled ? Text('') : Text(
                        'See all activity',
                        style:
                        TextStyle(color: Colors.blue, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Image.asset(
                        'images/img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Image.asset(
                        'images/img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Image.asset(
                        'images/img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Image.asset(
                        'images/img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Image.asset(
                        'images/img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Image.asset(
                        'images/img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Image.asset(
                        'images/img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]))
          ],
        ),
        !_isScrolled ? Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height *.65,
          child: Image.asset(
            'images/home_page.png',
            fit: BoxFit.fill,
          ),
        ) : Container(color: Colors.white,height: 0,),
      ],
    );
  }
}