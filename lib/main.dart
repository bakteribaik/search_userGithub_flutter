import 'package:belajar_list_2/model.dart';
import 'package:belajar_list_2/profile.dart';
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
  bool isValidate = false;
  bool isFetch = false;

  String name = '';
    String avatar = '';
      String url = '';
        String follower = '';
          String following = '';

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
              hintText: 'Search username/ID',
              border: InputBorder.none,
              errorText: isValidate? 'Put username/id' : null
            ),
          ),
          actions: [
            IconButton(onPressed: () async{
              if (controller.text.isEmpty) {
                return;
              } else {
                isFetch = true;
                github = await dataService.fetchData(controller.text);
                setState(() {});
              }
            }, icon: Icon(Icons.send),
            color: Colors.grey,)
          ],
        ),
        body: isFetch ? ListView.builder(
          itemCount: github.items!.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: CircleAvatar(
                child: Image.network('${github.items![index].avatarUrl}'),
              ),
              title: Text('${github.items![index].login}'),
              subtitle: Text('${github.items![index].htmlUrl}'),
              onTap: (){
                name = github.items![index].login.toString();
                avatar = github.items![index].avatarUrl.toString();
                url = github.items![index].htmlUrl.toString();
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => profile(
                    name : name,
                    avatar : avatar,
                    url : url,
                  ))
                );
              },
            );
        }) : SizedBox(),
      ),
    );
  }
}