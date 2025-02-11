
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

  factory FeedModel.fromJson(Map<String, dynamic> map, String documentId) {
    return FeedModel(
      id: documentId,
      titulo: map['titulo'] ?? '',
      descripcion: map['descripcion'] ?? '',
      ubicacion: map['ubicacion'] ?? '',
      fecha: map['fecha'] ?? '',
      categoria: map['categoria'] ?? '',
      imagen: map['imagen'] ?? '',
      organizador: map['organizador'] ?? '',
      organizadorImagen: map['organizadorImagen'] ?? '',
    );
  }
}
