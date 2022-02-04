import 'package:spot/core/utils/exports.dart';

class ChatListSample extends StatefulWidget {
  const ChatListSample({Key? key}) : super(key: key);

  @override
  ChatListSampleState createState() {
    return ChatListSampleState();
  }
}

class ChatListSampleState extends State<ChatListSample> {
  TextEditingController myController = TextEditingController();

  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    final chatfield = TextFormField(
      controller: myController,
      style: const TextStyle(
        decorationColor: Colors.white,
        color: Colors.white,
      ),
      autofocus: false,
      onSaved: (value) {},
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 100),
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                chatfield,
                MaterialButton(
                  child: const Text("send message"),
                  onPressed: () {
                    setState(() {
                      messages.add(myController.text);
                      myController.clear();
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
