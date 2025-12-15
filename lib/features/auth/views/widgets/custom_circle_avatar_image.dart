import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/features/auth/cubits/auth_cubit/auth_cubit.dart';

class CustomCircleAvatarImage extends StatelessWidget {
  const CustomCircleAvatarImage({
    super.key,
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 67,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 65,
        backgroundColor: Colors.grey,
        child: cubit.selectedImage == null
            ? Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              )
            : ClipOval(
                child: cubit.isGalleryImage
                    ? Image.file(
                        File(cubit.selectedImage!),
                        height: 130,
                        width: 130,
                        fit: BoxFit.contain,
                      )
                    : CachedNetworkImage(
                        imageUrl: cubit.selectedImage!,
                        height: 130,
                        width: 130,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Center(
                          child:
                              CupertinoActivityIndicator(),
                        ),
                        errorWidget:
                            (context, url, error) => Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                      ),
              ),
      ),
    );
  }
}
