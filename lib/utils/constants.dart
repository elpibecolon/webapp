class Constants {
  static const String AUTHORITY = 'localhost:44349';
  static const String BASE_URL = 'https://localhost/AgenciaViajes/api';

  //PORT
  static const String PORT = '44349';

  //USUARIOS
  static const String LOGIN = '/Auth';

  //VIAJEROS
  static const String VIAJEROS = '/Viajeros'; //POST: Registro y GET: Busqueda
  static const String ELIMINAR_VIAJERO = '/EliminarViajero'; //POST: Eliminar
  static const String ACTUALIZAR_VIAJERO = '/ActualizarViajero'; //POST: Upadate
  static const String LISTA_CEDULAS = '/CedulasViajeros'; //GET: lista cedulas

  //VIAJES
  static const String AGREGAR_VIAJE = '/AgregarViaje'; //POST: Registro
  static const String ACTUALIZAR_VIAJE = '/ActualizarViajes'; //POST: Update
  static const String VIAJES_SIN_ASIGNAR = '/ViajesSinAsignar'; //GET: Viajes
  static const String ELIMINAR_VIAJE = '/EliminarViaje'; //POST: Eliminar Viaje

  //TICKETS VIAJES
  static const String VIAJES_ASIGNADOS = '/ViajesAsignados';
}
