import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  // Función para abrir enlaces externos
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown[800],
      foregroundColor: Colors.white,
      elevation: 4,
      centerTitle: true,

      // 👇 Icono de menú hamburguesa (abre el Drawer)
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menú',
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),

      // 👇 Título / Logo en el centro
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        overflow: TextOverflow.ellipsis,
      ),

      // 👇 Acciones a la derecha: redes sociales + login
      actions: [
        // Facebook
        IconButton(
          icon: const Icon(Icons.facebook, size: 22),
          tooltip: 'Facebook',
          onPressed: () => _launchUrl('https://facebook.com/doleosplac'),
        ),
        // Instagram
        IconButton(
          icon: const Icon(Icons.camera_alt, size: 22),
          tooltip: 'Instagram',
          onPressed: () => _launchUrl('https://instagram.com/doleosplac'),
        ),
        // WhatsApp
        IconButton(
          icon: const Icon(Icons.chat, size: 22),
          tooltip: 'WhatsApp',
          onPressed: () => _launchUrl('https://wa.me/34639424602'),
        ),
        // Login
        IconButton(
          icon: const Icon(Icons.login, size: 22),
          tooltip: 'Iniciar sesión',
          onPressed: () => _showLoginDialog(context),
        ),
        const SizedBox(width: 8),
      ],

      // 👇 Drawer (menú hamburguesa lateral)
      // Nota: El Drawer se define en el Scaffold, no en el AppBar
    );
  }

  // Tamaño preferido del AppBar (altura estándar)
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  // Diálogo de login rápido
  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Iniciar sesión'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Usuario o email',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[800],
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              // 👇 Aquí puedes añadir la lógica real de login
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Inicio de sesión en desarrollo...'),
                  backgroundColor: Colors.brown,
                ),
              );
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}