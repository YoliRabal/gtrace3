class FeedModel {
  String titulo;
  String descripcion;
  String ubicacion;
  String fecha;
  String categoria1;
  String categoria2;
  String descripcionLarga;
  String horaInicio;
  String diaMes;
  String anio;
  String puntoSalida;
  String infoSalida;
  String distancia;
  String duracion;
  String puntoLlegada;
  String infoLlegada;
  String imagen;
  String organizador;
  String organizadorImagen;

  FeedModel({
    this.titulo = '',
    this.descripcion = '',
    this.ubicacion = '',
    this.fecha = '',
    this.categoria1 = '',
    this.categoria2 = '',
    this.descripcionLarga = '',
    this.horaInicio = '',
    this.diaMes = '',
    this.anio = '',
    this.puntoSalida = '',
    this.infoSalida = '',
    this.distancia = '',
    this.duracion = '',
    this.puntoLlegada = '',
    this.infoLlegada = '',
    this.imagen = '',
    this.organizador = '',
    this.organizadorImagen = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descripcion': descripcion,
      'ubicacion': ubicacion,
      'fecha': fecha,
      'categoria1': categoria1,
      'categoria2': categoria2,
      'descripcionLarga': descripcionLarga,
      'horaInicio': horaInicio,
      'diaMes': diaMes,
      'anio': anio,
      'puntoSalida': puntoSalida,
      'infoSalida': infoSalida,
      'distancia': distancia,
      'duracion': duracion,
      'puntoLlegada': puntoLlegada,
      'infoLlegada': infoLlegada,
      'imagen': imagen,
      'organizador': organizador,
      'organizadorImagen': organizadorImagen,
    };
  }

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      titulo: json['titulo'] ?? '',
      descripcion: json['descripcion'] ?? '',
      ubicacion: json['ubicacion'] ?? '',
      fecha: json['fecha'] ?? '',
      categoria1: json['categoria1'] ?? '',
      categoria2: json['categoria2'] ?? '',
      descripcionLarga: json['descripcionLarga'] ?? '',
      horaInicio: json['horaInicio'] ?? '',
      diaMes: json['diaMes'] ?? '',
      anio: json['anio'] ?? '',
      puntoSalida: json['puntoSalida'] ?? '',
      infoSalida: json['infoSalida'] ?? '',
      distancia: json['distancia'] ?? '',
      duracion: json['duracion'] ?? '',
      puntoLlegada: json['puntoLlegada'] ?? '',
      infoLlegada: json['infoLlegada'] ?? '',
      imagen: json['imagen'] ?? '',
      organizador: json['organizador'] ?? '',
      organizadorImagen: json['organizadorImagen'] ?? '',
    );
  }
}