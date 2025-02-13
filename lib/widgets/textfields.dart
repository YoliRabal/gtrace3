import 'package:gtrace3/config/imports.dart';

class TextFormFieldCustom extends StatefulWidget {

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();

  final TextEditingController? controller;

  final double height;
  final double width;
  final double radius;
  final double textSize;
  final double hintSize;
  final double elevation;

  final String labelText;
  final String hintText;
  final String helperText;
  final String errorText;
  final String sufixIcon;
  final String prefixIcon;
  final String prefixText;
  final String sufixText;

  final bool password;
  final bool shadow;
  final bool filled;
  final bool noPadding;

  final int maxLines;
  final int maxLength;
  final int minLines;

  final TextInputType textInputType;
  final TextCapitalization textCapitalization;

  final Color colorFill;
  final Color colorHint;

  final TextAlignVertical textAlignVertical;
  final TextStyle? textStyleCustom;

  final void Function()? onChange;
  final void Function()? onEditingComplete;

  final FocusNode? focusNode;
  final bool autofocus;



  const TextFormFieldCustom({super.key,

    this.controller,
    this.onChange,
    this.onEditingComplete,

    this.errorText = "",
    this.helperText = "",
    this.labelText = "",
    this.hintText = "",

    this.shadow = false,

    this.height = 45,
    this.width = double.infinity,

    this.hintSize = TEXTO_BODY_SIZE,
    this.textSize = TEXTO_BODY_SIZE,

    this.filled = true,
    this.radius = RADIUS,
    this.colorFill = COLOR_BACKGROUND_SECONDARY,
    this.colorHint = COLOR_SUBTEXT,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength = 0,
    this.elevation = 5,
    this.noPadding = false,

    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.password = false,

    this.textAlignVertical = TextAlignVertical.center,

    this.prefixIcon = "",
    this.sufixIcon = "",
    this.prefixText = "",
    this.sufixText = "",

    this.focusNode,

    this.textStyleCustom,
    this.autofocus = false,

  });

}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {

  bool visible = true;

  @override
  Widget build(BuildContext context) {

    return Container(

      width: widget.width,

      padding: null,
      margin:  null,

      decoration: BoxDecoration(

        color: null,
        borderRadius: null,
        boxShadow: widget.shadow ? [BoxShadowCustom()] : null,

      ),

      child: TextFormField(

        enableInteractiveSelection: true,

        focusNode: widget.focusNode,

        maxLines: widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength == 0 ? null : widget.maxLength,
        autofocus: widget.autofocus,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: widget.password ? visible : false,
        textCapitalization: widget.textCapitalization,
        textAlignVertical: widget.textAlignVertical,
        textAlign: TextAlign.start,

        style: widget.textStyleCustom ?? estiloBody(color: COLOR_TEXT),

        onTap: (){
          widget.controller!.selection = TextSelection(
            baseOffset: 0,
            extentOffset: widget.controller!.text.length,
          );
        },

        onChanged: (String texto){
          if(widget.onChange!=null){
            widget.onChange!();
          }
        },

        onEditingComplete: widget.onEditingComplete != null ? (){
          widget.onEditingComplete!();
        } : null,

        autovalidateMode:  widget.errorText.isNotEmpty ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,

        validator: (value){

          if(value != null && value.isNotEmpty){

            return null;

          }else{

            return widget.errorText;

          }
        },

        decoration: InputDecoration(

          alignLabelWithHint: true,

          errorStyle: estiloCaption(color: COLOR_ERROR),

          helperText: widget.helperText.isNotEmpty ?  widget.helperText : null,
          helperStyle: estiloBody(color: widget.colorHint),

          labelText: widget.labelText.isNotEmpty ?  widget.labelText : null,
          labelStyle: estiloBody(color: widget.colorHint),
          floatingLabelStyle: estiloBody(color: COLOR_TEXT, fontWeight: FontWeight.bold, ),

          hintText: widget.hintText.isNotEmpty ?  widget.hintText : null,
          hintStyle: estiloBody(color: widget.colorHint),

          filled: widget.filled ? true : null,
          fillColor: widget.colorFill != COLOR_BACKGROUND_SECONDARY ? widget.colorFill : null,

          //isDense: false,
          contentPadding: EdgeInsets.symmetric(horizontal: PADDING_DOUBLE, vertical: widget.height/2),

          enabledBorder:  widget.filled ?  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(widget.radius)), borderSide: BorderSide.none) : null,
          focusedBorder:  widget.filled ?  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(widget.radius)), borderSide: BorderSide.none) : null,
          errorBorder:  widget.filled ?  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(widget.radius)), borderSide: BorderSide.none) : null,
          focusedErrorBorder: widget.filled ?  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(widget.radius)), borderSide: BorderSide.none) : null,
          disabledBorder: widget.filled ?  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(widget.radius)), borderSide: BorderSide.none) : null,
          border: widget.filled ?  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(widget.radius)), borderSide: BorderSide.none) : null,

          prefixText: widget.prefixText.isNotEmpty ? widget.prefixText : null,
          suffixText: widget.sufixText.isNotEmpty ? widget.sufixText : null,
          prefixStyle: estiloBody(color: COLOR_ACCENT),
          suffixIcon: widget.password
              ? IconButton(icon: SvgCustom(icon: visible ? "ojo" : "ojos-cruzados", color:  visible ? COLOR_ACCENT.withOpacity(0.3) : COLOR_ACCENT), onPressed: () {setState(() {visible = !visible;});},)
              : widget.sufixIcon.isNotEmpty
              ? IconButton(icon: SvgCustom(icon: widget.sufixIcon, color: COLOR_ACCENT, size: 20), onPressed: () {},)
              : null,
          prefixIcon: widget.prefixIcon.isNotEmpty
              ? IconButton(icon: SvgCustom(icon: widget.prefixIcon, color: COLOR_ACCENT, size: 20), onPressed: () {},)
              : null,





        ),

      ),

    );

  }

}