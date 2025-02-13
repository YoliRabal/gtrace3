import 'package:gtrace3/config/imports.dart';

//ignore: must_be_immutable
class ImagePublish extends StatefulWidget {

  FileModel imageFile;
  Function(FileModel) onFinish;
  final double width;
  final double height;
  final bool isCircular;
  final bool hasRadius;
  final BoxFit boxFit;


  ImagePublish({

    super.key,

    required this.imageFile,
    required this.onFinish,
    this.width = 100,
    this.height = 100,
    this.isCircular = false,
    this.hasRadius = true,
    this.boxFit = BoxFit.cover,

  });

  @override
  _ImagePublishState createState() => _ImagePublishState();
}

class _ImagePublishState extends State<ImagePublish> {

  @override
  Widget build(BuildContext context) {

    return Stack(

      children: [

        Align(
          alignment: Alignment.center,
          child: Container(

            width: widget.width,
            height: widget.height,

            decoration: BoxDecoration(
              borderRadius: widget.hasRadius && !widget.isCircular ? BorderRadiusAll() : null,
              shape: widget.isCircular ? BoxShape.circle : BoxShape.rectangle,
              color: COLOR_BACKGROUND_SECONDARY,
              border: Border.all(width: 2, color: COLOR_BACKGROUND_TERCIARY.withOpacity(0.2)),
              boxShadow: const [BoxShadow(),],

              image: DecorationImage(
                  fit: widget.boxFit,
                  image: widget.imageFile.dataUint8List != null
                      ? MemoryImage(widget.imageFile.dataUint8List!)
                      : widget.imageFile.url.isEmpty ? const AssetImage("assets/image/nada.png") : NetworkImage(widget.imageFile.url)
              ),
            ),

            clipBehavior: Clip.antiAlias,

            child: TextButton(

              style: estiloTransparente(),
                onPressed: (){

                  pressedImage(context, onFinish: (FileModel file) {
                    widget.onFinish(file);
                  }, );

                },

                child: Center(

                    child: widget.imageFile.url.isNotEmpty || widget.imageFile.dataUint8List != null
                        ? Nada()
                        : SvgCustom(icon: "anadir-imagen", color: COLOR_ACCENT.withOpacity(0.5), size: 30)
                )
            ),

          ),

        ),

        AnimatedOpacity(

          duration: const Duration(milliseconds: 200),
          opacity: widget.imageFile.url.isNotEmpty || widget.imageFile.dataUint8List != null ? 1 : 0,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: widget.width/2),
            child: ButtonCustomIcon(
              size: 50,
              padding: 0,
              iconData: Icons.clear,
              onPressed: (){
                widget.onFinish(FileModel());
              },
            ),
          ),
        )

      ],

    );

  }

}


