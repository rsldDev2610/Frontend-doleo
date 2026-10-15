import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:test1/Components/appBar.dart';

class DoleoPage extends StatelessWidget {
  const DoleoPage({super.key});

  // Función para abrir enlaces (teléfono, email, redes sociales)
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Doleo\'s Plac',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- LOGO / ICONO ---
              const SizedBox(height: 20),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- TÍTULO ---
              const Text(
                'DECORMONTAJES\nDOLEO\'SPLAC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),

              // --- SUBTÍTULO ---
              const Text(
                'ESPECIALISTAS EN PLADUR Y DECORACIÓN\nDE INTERIORES, TABIQUERÍA SECA Y MÁS SERVICIOS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 30),

              // --- TARJETA DE CONTACTO ---
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'ÓSCAR LÓPEZ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const Divider(height: 20),

                      _buildContactTile(
                        icon: Icons.phone,
                        title: 'Teléfonos',
                        subtitle: '639 424 602\n643 378 395\n602 658 228',
                        onTap: () => _launchUrl('tel:639424602'),
                      ),
                      const SizedBox(height: 10),

                      _buildContactTile(
                        icon: Icons.email,
                        title: 'E-mail',
                        subtitle: 'dcmndoleosplac@hotmail.com',
                        onTap: () =>
                            _launchUrl('mailto:dcmndoleosplac@hotmail.com'),
                      ),
                      const SizedBox(height: 10),

                      _buildContactTile(
                        icon: Icons.facebook,
                        title: 'Facebook',
                        subtitle: '@doleosplac',
                        onTap: () =>
                            _launchUrl('https://facebook.com/doleosplac'),
                      ),
                      const SizedBox(height: 10),

                      _buildContactTile(
                        icon: Icons.camera_alt,
                        title: 'Instagram',
                        subtitle: 'doleosplac',
                        onTap: () =>
                            _launchUrl('https://instagram.com/doleosplac'),
                      ),
                      const SizedBox(height: 10),

                      _buildContactTile(
                        icon: Icons.location_on,
                        title: 'Ubicación',
                        subtitle: 'TORREJÓN DE ARDOZ\nMADRID',
                        onTap: () => _launchUrl(
                            'https://maps.google.com/?q=Torrejon+de+Ardoz+Madrid'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- BOTÓN DE WHATSAPP ---
              ElevatedButton.icon(
                onPressed: () => _launchUrl('https://wa.me/34639424602'),
                icon: const Icon(Icons.chat, color: Colors.white),
                label: const Text(
                  'Contactar por WhatsApp',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Widget reutilizable para las filas de contacto
  Widget _buildContactTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.brown[50],
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.brown[800], size: 24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}