import 'package:flutter/material.dart';
import 'package:layer_first/widgets/ktext_form_field.dart';
import 'package:layer_first/widgets/rectangle_button.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        child: Column(
          children: [
            KTextFormField(
              controller: titleController,
              validator: (val){
                if(val?.isEmpty ?? false){
                  return "Please enter title";
                }
                return null;
              },
            ),
            SizedBox(height: 24,),
            KTextFormField(
              controller: descriptionController,
              validator: (val){
                if(val?.isEmpty ?? false){
                  return "Please enter description";
                }
                return null;
              },
            ),
            SizedBox(height: 24,),
            RectangleButton(
              text: "Submit".toUpperCase(),
              onPressed: (){
                if (formKey.currentState!.validate()){

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
