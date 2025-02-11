
class FeedModel {
  String id;
  String titulo;
  String descripcion;
  String ubicacion;
  String fecha;
  String categoria;
  String imagen;
  String organizador;
  String organizadorImagen;

  // Constructor con valores predeterminados
  FeedModel({
    this.id = '',
    this.titulo = '',
    this.descripcion = '',
    this.ubicacion = '',
    this.fecha = '',
    this.categoria = '',
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
      'categoria': categoria,
      'imagen': imagen,
      'organizador': organizador,
      'organizadorImagen': organizadorImagen,
    };
  }

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      id: json['titulo'] ?? '',
      titulo: json['titulo'] ?? '',
      descripcion: json['descripcion'] ?? '',
      ubicacion: json['ubicacion'] ?? '',
      fecha: json['fecha'] ?? '',
      categoria: json['categoria'] ?? '',
      imagen: json['imagen'] ?? '',
      organizador: json['organizador'] ?? '',
      organizadorImagen: json['organizadorImagen'] ?? '',
    );
  }
}
