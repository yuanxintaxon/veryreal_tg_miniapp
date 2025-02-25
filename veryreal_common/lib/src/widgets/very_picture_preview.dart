import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veryreal_common/veryreal_common.dart';

class VeryPicturePreview extends StatelessWidget {
  VeryPicturePreview({
    super.key,
    this.currentIndex = 0,
    this.images = const [],
    this.heroTag,
    this.onTap,
    this.onLongPress,
  }) : controller = images.length > 1
            ? ExtendedPageController(initialPage: currentIndex, pageSpacing: 50)
            : null;
  final int currentIndex;
  final List<MediaSource> images;
  final String? heroTag;
  final Function()? onTap;
  final Function(String url)? onLongPress;
  final ExtendedPageController? controller;
  GlobalKey<ExtendedImageSlidePageState> slidePagekey =
      GlobalKey<ExtendedImageSlidePageState>();
  @override
  Widget build(BuildContext context) {
    return ExtendedImageSlidePage(
      key: slidePagekey,
      slideAxis: SlideAxis.vertical,
      slidePageBackgroundHandler: (offset, pageSize) =>
          defaultSlidePageBackgroundHandler(
        color: Colors.black,
        offset: offset,
        pageSize: pageSize,
      ),
      child: MetaHero(
        heroTag: heroTag,
        onTap: onTap ?? () => Get.back(),
        onLongPress: () {
          final index = controller?.page?.round() ?? 0;
          onLongPress?.call(images[index].url);
        },
        child: _childView,
      ),
    );
  }

  Widget get _childView {
    return images.length == 1 ? _networkGestureImage(images[0]) : _pageView;
  }

  Widget get _pageView => ExtendedImageGesturePageView.builder(
        controller: controller,
        onPageChanged: (int index) {},
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return _networkGestureImage(images.elementAt(index));
        },
      );

  Widget _networkGestureImage(MediaSource source) => ExtendedImage.network(
        source.thumbnail,
        fit: BoxFit.contain,
        mode: ExtendedImageMode.gesture,
        clearMemoryCacheWhenDispose: true,
        clearMemoryCacheIfFailed: true,
        handleLoadingProgress: true,
        enableSlideOutPage: true,
        initGestureConfigHandler: (ExtendedImageState state) {
          return GestureConfig(
            //you must set inPageView true if you want to use ExtendedImageGesturePageView
            inPageView: true,
            initialScale: 1.0,
            maxScale: 5.0,
            animationMaxScale: 6.0,
            initialAlignment: InitialAlignment.center,
          );
        },
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              {
                if (source.url.isVideoFileName) {
                  return null;
                }
                final ImageChunkEvent? loadingProgress = state.loadingProgress;
                final double? progress =
                    loadingProgress?.expectedTotalBytes != null
                        ? loadingProgress!.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null;
                // CupertinoActivityIndicator()
                return SizedBox(
                  width: 15.0,
                  height: 15.0,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Styles.c_000000,
                      strokeWidth: 1.5,
                      value: progress ?? 0,
                    ),
                  ),
                );
              }
            case LoadState.completed:
              final url = source.url;
              /*
              if (url.isVideoFileName) {
                return Center(
                    child: VeryVideoPlayerView(
                  url: url,
                  coverUrl: source.thumbnail,
                ));
              }
              */
              return Center(
                child: ExtendedImage.network(url),
              );
            case LoadState.failed:
              // remove memory cached
              state.imageProvider.evict();
              return ImageRes.pictureError.toImage;
          }
        },
      );
}

class MetaHero extends StatelessWidget {
  const MetaHero({
    super.key,
    required this.heroTag,
    required this.child,
    this.onTap,
    this.onLongPress,
  });
  final Widget child;
  final String? heroTag;
  final Function()? onTap;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final view = GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      onLongPress: onLongPress,
      child: child,
    );
    return heroTag == null ? view : Hero(tag: heroTag!, child: view);
  }
}
