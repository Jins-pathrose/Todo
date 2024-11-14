// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/view/home.dart';
import 'package:todo/domain/edit/bloc/edit_bloc.dart';
import 'package:todo/domain/entities/todo_entity.dart';
import 'package:todo/domain/post/bloc/post_bloc.dart';


class AddTodo extends StatelessWidget {
  bool isEdit = false;
  String? id;
  TodoEntity? model;
  AddTodo({
    this.model,
    this.id,
    required this.isEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isEdit) {
      titleController.text = model!.title.toString();
      descriptionController.text = model!.description.toString();
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          isEdit ? 'Edit Todo' : 'Add Todo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: titleController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  hintText: 'Add title',
                  hintStyle: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              width: 10,
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextStyle(color: Colors.white)),
              maxLines: 5,
              controller: descriptionController,
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => isEdit ? edit(context) : submit(context),
              child: Container(
                width: 230,
                height: 40,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(isEdit ? 'Edit' : 'Submit',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16))),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 80, 194, 226),
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void edit(BuildContext context) {
    BlocProvider.of<EditBloc>(context).add(TodoEditEvent(
        id: id ?? '1',
        description: descriptionController.text,
        title: titleController.text));
    titleController.clear();
    descriptionController.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
      (route) => false,
    );
  }

  void submit(BuildContext context) {
    BlocProvider.of<PostBloc>(context).add(TodoPostEvent(
        title: titleController.text, description: descriptionController.text));
    titleController.clear();
    descriptionController.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
      (route) => false,
    );
    // Navigator.pop(context);
  }
}

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
