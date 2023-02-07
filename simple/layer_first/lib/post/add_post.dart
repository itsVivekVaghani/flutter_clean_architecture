import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layer_first/home/cubit/post_cubit.dart';
import 'package:layer_first/widgets/ktext_form_field.dart';
import 'package:layer_first/widgets/rectangle_button.dart';
import 'package:post_repository/models/post_request.dart';
import 'package:post_repository/repository.dart';

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
    return BlocProvider<PostCubit>(
      create: (context) =>
          PostCubit(postRepository: HttpsPostRepository()),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: BlocConsumer<PostCubit, PostState>(
              listener: (context, state) {
                if (state is PostFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Color(0xff9D0027,),
                      content: Text(
                        state.message,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),),);
                }
                if(state is AddPostSuccess){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Color(0xff009323,),
                    content: Text(
                      "Add Post Successfully",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),),);
                }
              },
              builder: (context, state) => Column(
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
                    isLoading: state is PostLoading,
                    onPressed: (){
                      if (formKey.currentState!.validate()){
                        context
                            .read<PostCubit>()
                            .addPost(
                              request: PostRequest(
                                userId: 1,
                                body: descriptionController.text,
                                title: titleController.text,
                              )
                        );
                      }
                    },
                  ),
                ],
              ),
          ),
        ),
      ),
    );


  }
}
