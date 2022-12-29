import 'package:flutter/material.dart';

import '../utils/text.dart';

class DiscoverDescription extends StatefulWidget {
  final String? name, description, bannerurl, posterurl, vote, launch_on;
  const DiscoverDescription(
      {Key? key,
      this.name,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);

  @override
  State<DiscoverDescription> createState() => _DiscoverDescriptionState();
}

class _DiscoverDescriptionState extends State<DiscoverDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: ListView(children: [
            Container(
                height: 250,
                child: Stack(children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        widget.bannerurl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      child: modifiedtext(
                          text:
                              '⭐ Average Rating - ' + widget.vote.toString())),
                ])),
            SizedBox(height: 15),
            Container(
                padding: EdgeInsets.all(10),
                child: modifiedtext(
                    text: widget.name != null ? widget.name : 'Not Loaded',
                    size: 24)),
            Container(
                padding: EdgeInsets.only(left: 10),
                child: modifiedtext(
                    text: 'Releasing On - ' + widget.launch_on.toString(),
                    size: 14)),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 100,
                  child: Image.network(widget.posterurl.toString()),
                ),
                Flexible(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: modifiedtext(text: widget.description, size: 18)),
                ),
              ],
            )
          ]),
        ));
  }
}
