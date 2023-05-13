import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class {{my_network_image.pascalCase()}} extends StatelessWidget {
  const {{my_network_image.pascalCase()}}({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
    this.radius,
    this.placeholder,
  }) : super(key: key);
  final String? url;
  final double? height;
  final double? width;
  final double? radius;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ??
          "https://images.unsplash.com/photo-1683322601458-85c1fb78274b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      imageBuilder: (context, imageProvider) => _CachedNetworkImageChild(
        imageProvider: imageProvider,
        height: height,
        width: width,
        radius: radius,
      ),
      placeholder: (context, url) => "{{file_name}}".isNotEmpty 
          ? _CachedNetworkImageChild(
              imageProvider: const AssetImage("assets/{{file_name}}"),
              height: height,
              width: width,
              radius: radius,
            )
          : placeholder ?? const CircularProgressIndicator.adaptive(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class _CachedNetworkImageChild extends StatelessWidget {
  const _CachedNetworkImageChild({
    Key? key,
    required this.imageProvider,
    required this.height,
    required this.width,
    required this.radius,
  }) : super(key: key);
  final ImageProvider<Object> imageProvider;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        radius ?? 20,
      ),
      child: Container(
        height: height ?? 350,
        width: width ?? 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
