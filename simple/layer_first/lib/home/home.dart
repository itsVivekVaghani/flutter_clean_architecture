import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layer_first/home/cubit/post_cubit.dart';
import 'package:layer_first/post/add_post.dart';
import 'package:post_repository/models/post_model.dart';
import 'package:post_repository/repository.dart';
import 'package:layer_first/widgets/expanded_section.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (context) => PostCubit(postRepository: HttpsPostRepository())
        ..getPost(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Layer First"),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      currentStep = 0;
                    });
                  },
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      currentStep = 1;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Builder(
          builder: (context) {
            if(currentStep == 1){
              return AddPost();
            }else {
              return BlocConsumer<PostCubit, PostState>(
                listener: (context, state) {
                  if (state is PostFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(
                        backgroundColor: Color(0xFF9D0027),
                        content: Text(
                          state.message,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),),);
                  }
                },
                builder: (context, state) {
                  if(state is PostLoading){
                    return Center(
                      child: CircularProgressIndicator(
                          color: Colors.green,),
                    );
                  }else if(state is PostSuccess){
                    return ListView(
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
                      children: [
                        ...List.generate(state.postResponse.length, (index) => _HomeItemCard(
                          model: state.postResponse[index],
                        ),),
                        // _HomeItemCard(),
                        // _HomeItemCard(),
                      ],
                    );
                  }else {
                    return SizedBox.shrink();
                  }
                },
              );
            }
          },
        ),
      ),
    );




  }
}

class _HomeItemCard extends StatefulWidget {
  final PostResponse model;
  const _HomeItemCard({Key? key, required this.model}) : super(key: key);

  @override
  State<_HomeItemCard> createState() => _HomeItemCardState();
}

class _HomeItemCardState extends State<_HomeItemCard> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          setState(() {
            expand = !expand;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                ],
              ),
            ),
            ExpandedSection(
              expand: expand,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Column(
                  children: [
                    Text(
                  widget.model.body,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

