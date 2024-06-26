import 'dart:convert';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:polyphasic_sleep_new/components/my_textfield.dart';
import 'package:polyphasic_sleep_new/models/qna_model.dart';
import 'package:flutter/services.dart' as rootbundle;

class HowItWorksPage extends StatefulWidget {
  const HowItWorksPage({super.key});

  @override
  State<HowItWorksPage> createState() => _HowItWorksPageState();
}

class _HowItWorksPageState extends State<HowItWorksPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(" H O W    I T    W O R K S",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontSize: 20)),
          ),
        )),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FutureBuilder(
                      future: readJsonData(),
                      builder: (context, data) {
                        if (data.hasError) {
                          return Center(child: Text("${data.error}"));
                        } else if (data.hasData) {
                          var qna = data.data as List<QnaModel>;
                          return Column(
                            children: [
                              for (int i = 0; i < qna.length; i++)
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: BubbleSpecialOne(
                                        text: qna[i].question!,
                                        color: const Color(0xFF1B97F3),
                                        tail: true,
                                        isSender: true,
                                        textStyle: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    for (int j = 0;
                                        j < qna[i].answer!.length;
                                        j++)
                                      (j == 0)
                                          ? BubbleSpecialOne(
                                              text: qna[i].answer![j],
                                              color: const Color(0xFFE8E8EE),
                                              tail: true,
                                              isSender: false,
                                            )
                                          : BubbleSpecialOne(
                                              text: qna[i].answer![j],
                                              color: const Color(0xFFE8E8EE),
                                              tail: false,
                                              isSender: false,
                                            ),
                                  ],
                                ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              ),
            ),
            _buildUserInput()
          ],
        ));
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: MyTextfield(
              focusNode: myFocusNode,
              hintText: "Ask me more about Polyphasic Sleep",
              controller: _messageController,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(220, 76, 175, 79),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () async {
                  var box = await Hive.openBox('test');
                  box.put('name', 'harsh');
                  print(box.get('name'));
                },
                icon: Icon(
                  Icons.arrow_upward,
                  color: Theme.of(context).colorScheme.surface,
                )),
          )
        ],
      ),
    );
  }
}

Future<List<QnaModel>> readJsonData() async {
  final jsondata =
      await rootbundle.rootBundle.loadString('json/questions.json');
  // print(jsondata);
  final list = json.decode(jsondata) as List<dynamic>;
  List<QnaModel> res = [];
  for (var item in list) {
    res.add(QnaModel.fromJson(item));
  }
  return res;
  // return list.map((e) => DataModel.fromJson(e)).toList();
}
