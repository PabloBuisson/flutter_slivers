import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSliverFillRemaining extends StatefulWidget {
  static final String id = 'sliver_fill_remaining';
  static final String name = 'SliverFillRemaining';

  get idScreen => CustomSliverFillRemaining.id;
  get nameScreen => CustomSliverFillRemaining.name;

  @override
  _CustomSliverFillRemainingState createState() =>
      _CustomSliverFillRemainingState();
}

class _CustomSliverFillRemainingState extends State<CustomSliverFillRemaining> {
  Future<String> asyncData;

  Future<String> getData({bool shouldFail, bool withContent}) async {
    await Future<void>.delayed(Duration(seconds: 3));
    if (shouldFail != null && shouldFail) {
      throw PlatformException(code: '404');
    }
    if (withContent != null && withContent) {
      return 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    asyncData = getData(shouldFail: true);
  }

  void retry({bool withContent}) {
    setState(() {
      asyncData = getData(shouldFail: false, withContent: withContent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverFillRemaining'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          // prevent bug when creating a SliverToBoxAdapter dynamically
          SliverToBoxAdapter(
            child: Container(
              width: 0.0,
              height: 0.0,
            ),
          ),
          FutureBuilder(
              future: asyncData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // place the loading widget in the middle of the screen
                  // useful to center any widget in the middle of the screen
                  return SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  // fills any empty space in the viewport
                  return SliverFillRemaining(
                    child: TextAndButton(
                      content: 'An error occurred',
                      buttonText: 'Retry',
                      onPressed: () => retry(withContent: false),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  // create a box surrounding the data
                  // fits the child widget with the space it needs
                  // do NOT use a SliverFillRemaining in this case,
                  // because it will throw an Overflow error
                  return SliverToBoxAdapter(
                    child: Container(
                        padding: const EdgeInsets.only(
                            left: 30.0, top: 30.0, right: 10.0, bottom: 30.0),
                        child: Text(
                          snapshot.data,
                          textScaleFactor: 1.5,
                        )),
                  );
                }
                // place the message in the middle of the screen
                return SliverFillRemaining(
                  child: Center(
                      child: TextAndButton(
                    content: 'Oups ! No content',
                    buttonText: 'Retry again',
                    onPressed: () => retry(withContent: true),
                  )),
                );
              }),
        ],
      ),
    );
  }
}

class TextAndButton extends StatelessWidget {
  const TextAndButton({Key key, this.content, this.buttonText, this.onPressed})
      : super(key: key);
  final String content;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            content,
            style: Theme.of(context).textTheme.headline5,
          ),
          ElevatedButton(
            child: Text(buttonText,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white)),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
