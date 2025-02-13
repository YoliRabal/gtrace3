export 'package:gtrace3/screens/details/widgets/botonreserva_widget.dart';
export 'package:gtrace3/screens/details/widgets/cabecera_widget.dart';
export 'package:gtrace3/screens/details/widgets/descripcion_widget.dart';
export 'package:gtrace3/screens/details/widgets/espacio.dart';
export 'package:gtrace3/screens/details/widgets/horario_widget.dart';
export 'package:gtrace3/screens/details/widgets/imagen_widget.dart';
export 'package:gtrace3/screens/details/widgets/ruta_widget.dart';
export 'package:gtrace3/screens/onboarding/onboarding.dart';
export 'package:gtrace3/screens/onboarding/variables.dart';
export 'package:gtrace3/screens/utils/backgrounds/backgrounds.dart';
export 'package:gtrace3/screens/onboarding/widgets/desplegable.dart';
export 'package:gtrace3/screens/onboarding/screens/1bienvenida.dart';
export 'package:gtrace3/screens/onboarding/screens/2datos_nombre.dart';
export 'package:gtrace3/screens/onboarding/screens/3datos_foto.dart';
export 'package:gtrace3/screens/onboarding/screens/loading_onboarding.dart';
export 'package:gtrace3/screens/login/widgets/image_publish.dart';

//PACKAGES
export 'dart:math';
export 'dart:io';
export 'dart:async';
export 'dart:ui' hide Image, decodeImageFromList, TextStyle, ImageDecoderCallback, Gradient, StrutStyle;
export 'dart:convert' hide Codec;
export 'dart:collection';

//PACKAGES OFFICIALS
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'package:flutter/services.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/rendering.dart';
export 'package:flutter/material.dart';
export 'package:flutter/gestures.dart';

//PACKAGES ADDED
export 'package:google_fonts/google_fonts.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:google_sign_in/google_sign_in.dart';
export 'package:cloud_firestore/cloud_firestore.dart' hide kIsWasm;
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_storage/firebase_storage.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:path_provider/path_provider.dart';

//FIREBASE
export 'package:firebase_core/firebase_core.dart';
export 'package:gtrace3/functions/firebase/firebase_auth.dart';
export 'package:gtrace3/functions/firebase/firebase_checks.dart';
export 'package:gtrace3/functions/firebase/firebase_reads.dart';
export 'package:gtrace3/firebase_options.dart';
export 'package:gtrace3/functions/firebase/firebase_updates.dart';
export 'package:gtrace3/functions/firebase/firebase_writes.dart';
export 'package:gtrace3/functions/firebase/storage_functions.dart';

//CONFIG
export 'package:gtrace3/config/theme/theme.dart';
export 'package:gtrace3/config/styles/text_styles.dart';
export 'package:gtrace3/config/variables/variables.dart';
export 'package:gtrace3/config/const/const.dart';

//FUNCTIONS
export 'package:gtrace3/functions/move_to.dart';
export 'package:gtrace3/functions/open_modals.dart';
export 'package:gtrace3/functions/open_url.dart';
export 'package:gtrace3/functions/get_images.dart';


//MODELS
export 'package:gtrace3/models/feed/feed_model.dart';
export 'package:gtrace3/models/user/users_model.dart';
export 'package:gtrace3/models/default_model.dart';
export 'package:gtrace3/models/file_model.dart';


//WIDGETS
export 'package:gtrace3/widgets/botones.dart';
export 'package:gtrace3/widgets/loading.dart';
export 'package:gtrace3/widgets/textfields.dart';
export 'package:gtrace3/widgets/nada.dart';
export 'package:gtrace3/widgets/svgcustom.dart';
export 'package:gtrace3/widgets/containers.dart';
export 'package:gtrace3/widgets/snackbar.dart';
export 'package:gtrace3/widgets/checkbox.dart';
export 'package:gtrace3/widgets/relleno.dart';
export 'package:gtrace3/widgets/animation.dart';

//HOME
export 'package:gtrace3/screens/home.dart';

//LOGIN
export 'package:gtrace3/screens/login/widgets/buttons_down.dart';
export 'package:gtrace3/screens/login/widgets/hero_background_opacity.dart';

//LOGIN
export 'package:gtrace3/screens/login/registrarse.dart';
export 'package:gtrace3/screens/login/lost_pass.dart';
export 'package:gtrace3/screens/login/iniciarsesion.dart';

//MAIN
export 'package:gtrace3/main.dart';
export 'package:sign_in_with_apple/sign_in_with_apple.dart' hide IconAlignment;