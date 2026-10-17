import 'package:flutter/material.dart';

void main() {
  runApp(const InPrintApp());
}

// PALETA DE COLORES DE INPRINT
class InPrintColors {
  static const Color crema = Color(0xFFFDF5F0);
  static const Color rosa = Color(0xFFF01983);
  static const Color azul = Color(0xFF20A8DC);
  static const Color morado = Color(0xFF9147E8);
  static const Color amarillo = Color(0xFFFFC52E);
  static const Color negro = Color(0xFF171923);
  static const Color gris = Color(0xFF77727C);
  static const Color rosaSuave = Color(0xFFFFE4F0);
  static const Color moradoSuave = Color(0xFFF0E6FF);
  static const Color azulSuave = Color(0xFFE2F5FC);
  static const Color amarilloSuave = Color(0xFFFFF4D2);
  static const Color borde = Color(0xFFF0DCE5);
}

class InPrintApp extends StatelessWidget {
  const InPrintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InPrint',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: InPrintColors.crema,
        colorScheme: ColorScheme.fromSeed(
          seedColor: InPrintColors.rosa,
          primary: InPrintColors.rosa,
          secondary: InPrintColors.morado,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: InPrintColors.crema,
          foregroundColor: InPrintColors.negro,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const ServiciosScreen(),
    );
  }
}

class ServiciosScreen extends StatefulWidget {
  const ServiciosScreen({super.key});

  @override
  State<ServiciosScreen> createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<ServiciosScreen> {
  final TextEditingController buscador = TextEditingController();

  int opcionSeleccionada = 1;
  String textoBusqueda = '';

  final List<Map<String, dynamic>> servicios = [
    {
      'nombre': 'Lonas',
      'descripcion': 'Ideales para publicidad y eventos.',
      'icono': Icons.crop_square,
      'color': InPrintColors.rosa,
      'fondo': InPrintColors.rosaSuave,
    },
    {
      'nombre': 'Tarjetas',
      'descripcion': 'Presenta tu marca con gran diseño.',
      'icono': Icons.credit_card_outlined,
      'color': InPrintColors.azul,
      'fondo': InPrintColors.azulSuave,
    },
    {
      'nombre': 'Invitaciones',
      'descripcion': 'Para todo tipo de eventos.',
      'icono': Icons.mail_outline,
      'color': InPrintColors.morado,
      'fondo': InPrintColors.moradoSuave,
    },
    {
      'nombre': 'Flyers',
      'descripcion': 'Promociona tus ideas.',
      'icono': Icons.insert_drive_file_outlined,
      'color': InPrintColors.amarillo,
      'fondo': InPrintColors.amarilloSuave,
    },
    {
      'nombre': 'Etiquetas',
      'descripcion': 'Personaliza tus productos.',
      'icono': Icons.sell_outlined,
      'color': InPrintColors.rosa,
      'fondo': InPrintColors.rosaSuave,
    },
  ];

  @override
  void dispose() {
    buscador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serviciosFiltrados = servicios.where((servicio) {
      return servicio['nombre']
          .toString()
          .toLowerCase()
          .contains(textoBusqueda.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: InPrintColors.rosa,
            size: 26,
          ),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        titleSpacing: 0,
        title: const Text(
          'Servicios',
          style: TextStyle(
            color: InPrintColors.negro,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: InPrintColors.rosaSuave,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: InPrintColors.rosa,
                  size: 23,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // ENCABEZADO
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '¡Dale vida a tus ideas!',
                style: TextStyle(
                  fontSize: 15,
                  color: InPrintColors.gris,
                ),
              ),
            ),
          ),

          // BUSCADOR
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 22),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: InPrintColors.borde,
                  width: 1.3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: InPrintColors.rosa.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: buscador,
                onChanged: (texto) {
                  setState(() {
                    textoBusqueda = texto;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Buscar un servicio...',
                  hintStyle: TextStyle(
                    color: Color(0xFF89838D),
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: InPrintColors.rosa,
                    size: 27,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ),

          // TÍTULO DE LA LISTA
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 15),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Nuestros servicios',
                    style: TextStyle(
                      color: InPrintColors.negro,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: InPrintColors.amarilloSuave,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${serviciosFiltrados.length} opciones',
                    style: const TextStyle(
                      color: InPrintColors.negro,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // LISTA DE SERVICIOS
          Expanded(
            child: serviciosFiltrados.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          color: InPrintColors.morado,
                          size: 48,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'No encontramos ese servicio',
                          style: TextStyle(
                            color: InPrintColors.gris,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(28, 0, 28, 16),
                    itemCount: serviciosFiltrados.length,
                    itemBuilder: (context, index) {
                      final servicio = serviciosFiltrados[index];

                      final color =
                          servicio['color'] as Color;
                      final fondo =
                          servicio['fondo'] as Color;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        padding: const EdgeInsets.all(14),
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: InPrintColors.borde
                                .withOpacity(0.7),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: InPrintColors.negro
                                  .withOpacity(0.035),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // ICONO DE CADA SERVICIO
                            Container(
                              width: 62,
                              height: 62,
                              decoration: BoxDecoration(
                                color: fondo,
                                borderRadius:
                                    BorderRadius.circular(17),
                              ),
                              child: Icon(
                                servicio['icono'] as IconData,
                                color: color,
                                size: 30,
                              ),
                            ),

                            const SizedBox(width: 14),

                            // INFORMACIÓN DEL SERVICIO
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text(
                                    servicio['nombre'] as String,
                                    style: const TextStyle(
                                      color: InPrintColors.negro,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    servicio['descripcion'] as String,
                                    style: const TextStyle(
                                      color: InPrintColors.gris,
                                      fontSize: 12,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    'Desde \$...',
                                    style: TextStyle(
                                      color: color,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Icon(
                              Icons.chevron_right_rounded,
                              color: Color(0xFFB8B1BC),
                              size: 25,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      // BARRA DE NAVEGACIÓN INFERIOR
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: InPrintColors.borde,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 75,
            child: Row(
              children: [
                _crearBotonNavegacion(
                  icono: Icons.home_outlined,
                  texto: 'Inicio',
                  indice: 0,
                ),
                _crearBotonNavegacion(
                  icono: Icons.receipt_long_outlined,
                  texto: 'Pedidos',
                  indice: 1,
                ),
                _crearBotonNavegacion(
                  icono: Icons.person_outline,
                  texto: 'Perfil',
                  indice: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearBotonNavegacion({
    required IconData icono,
    required String texto,
    required int indice,
  }) {
    final seleccionado = opcionSeleccionada == indice;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            opcionSeleccionada = indice;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: seleccionado
                    ? InPrintColors.rosaSuave
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icono,
                size: 25,
                color: seleccionado
                    ? InPrintColors.rosa
                    : const Color(0xFF89838D),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              texto,
              style: TextStyle(
                fontSize: 11,
                fontWeight: seleccionado
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: seleccionado
                    ? InPrintColors.rosa
                    : InPrintColors.gris,
              ),
            ),
          ],
        ),
      ),
    );
  }
}