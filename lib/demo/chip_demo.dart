import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({Key? key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];
  String _action = "Nothing";
  List<String> _selected = [];
  String _choice = "Lemon";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChipDemo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                Chip(label: Text("Life")),
                Chip(
                  label: Text("Sunset"),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text("xiongtao"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Text("tao"),
                  ),
                ),
                Chip(
                  label: Text("xiongtao"),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.itying.com/images/flutter/5.png"),

                  ),
                ),
                Chip(
                  label: Text("带删除"),
                  deleteIcon: Icon(Icons.delete),
                  onDeleted: () {},
                  deleteIconColor: Colors.black,
                  deleteButtonTooltipMessage: "remove",
                ),
                Divider(
                  height: 32.0,
                  color: Colors.grey,
                ),
                Wrap(
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  height: 32.0,
                  color: Colors.grey,
                ),
                Container(
                  width: double.infinity,
                  child: Text("ActionChip:${_action}"),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(label: Text(tag), onPressed: () {
                      setState(() {
                        _action = tag;
                      });
                    });
                  }).toList(),
                ),
                Divider(
                  height: 32.0,
                  color: Colors.grey,
                ),
                Container(
                  width: double.infinity,
                  child: Text("FilterChip:${_selected.toString()}"),
                ),
                Wrap(
                  children: _tags.map((tag) {
                    return FilterChip(
                        label: Text(tag),
                        selected: _selected.contains(tag),
                        onSelected: (v) {
                          setState(() {
                            if (_selected.contains(tag)) {
                              _selected.remove(tag);
                            } else {
                              _selected.add(tag);
                            }
                          });
                        }
                    );
                  }).toList(),
                ),
                Divider(
                  height: 32.0,
                  color: Colors.grey,
                ),
                Container(
                  width: double.infinity,
                  child: Text("choice:${_choice}"),
                ),
                Wrap(
                  children: _tags.map((e){
                    return ChoiceChip(
                        label: Text(e),
                        selectedColor: Colors.grey,
                        selected: _choice == e,
                      onSelected: (v){
                          setState(() {
                            if(v){
                              _choice = e;
                            }

                          });
                      },
                    );
                  }).toList(),
                )
              ],
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: (){
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];
            _selected = [];
            _choice = "Lemon";
          });
        },
      ),
    );
  }
}