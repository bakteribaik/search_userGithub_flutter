import 'package:belajar_list_2/model.dart';
import 'package:belajar_list_2/service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  TextEditingController controller = TextEditingController();
  DataService dataService = DataService();
  Github github = Github();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextField(
            controller: controller,
            decoration: InputDecoration(
              icon: Icon(Icons.search_outlined),
              hintText: 'Search',
              border: InputBorder.none,
            ),
          ),
          actions: [
            IconButton(onPressed: () async{
              isFetch = true;
               github = await dataService.fetchData(controller.text);
                setState(() {});
            }, icon: Icon(Icons.send),
            color: Colors.grey,)
          ],
        ),
        body: isFetch ? ListView.builder(
          itemCount: github.items!.length,
          itemBuilder: (contex, index){
            return ListTile(
              leading: CircleAvatar(
                child: Image.network('${github.items![index].avatarUrl}'),
              ),
              title: Text('${github.items![index].login}'),
              subtitle: Text('${github.items![index].htmlUrl}'),
              onTap: (){
                print('${github.items![index].htmlUrl}');
              },
            );
        }) : SizedBox(),
      ),
    );
  }
}