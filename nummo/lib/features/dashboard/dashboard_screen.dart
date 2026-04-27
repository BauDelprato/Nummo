import 'package:flutter/material.dart';
import 'package:nummo/features/dashboard/menu_screens/charts_screen.dart';
import 'package:nummo/features/dashboard/menu_screens/help_screen.dart';
import 'package:nummo/features/dashboard/menu_screens/reminders_screen.dart';
import 'package:nummo/features/dashboard/menu_screens/settings_screen.dart';
import 'package:nummo/features/dashboard/newExpense_screen.dart';
//import 'package:provider/provider.dart'; //x si acaso
//import '../../shared/widgets/custom_button.dart';
//import '../../core/utils/helpers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nummo/shared/widgets/drawer_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF81D4FA), 
      
      // 1. EL MENÚ SUPERIOR (AppBar + Drawer)
      appBar: AppBar(
        backgroundColor: const Color(0xFF29B6F6),
        elevation: 0,
      ),
      drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      // Encabezado del menú (donde podrías poner el logo de Nummo)
      const DrawerHeader(
        decoration: BoxDecoration(color: Color(0xFF29B6F6)),
        child: Text(
          'Nummo',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      // Item: HOME
      DrawerItem(
        icon: Icons.home,
        title: 'Home',
        page: const DashboardScreen(), // Tu pantalla principal
      ),

      // Item: CHARTS (Gráficos)
      DrawerItem(
        icon: Icons.pie_chart,
        title: 'Charts',
        page: const ChartsScreen(),
      ),

      // Item: RECORDATORIOS
      DrawerItem(
        icon: Icons.notifications,
        title: 'Recordatorios',
        page: const RemindersScreen(),
      ),

      // Item: MERCADO PAGO
      /*DrawerItem(
        icon: Icons.account_balance_wallet,
        title: 'Conectar con Mercado Pago',
        page: const MercadoPagoScreen(),
      ),
      */
      const Divider(), // Una línea separadora para Ajustes y Ayuda

      // Item: AJUSTES
      DrawerItem(
        icon: Icons.settings,
        title: 'Ajustes',
        page: const SettingsScreen(),
      ),

      // Item: AYUDA
      DrawerItem(
        icon: Icons.help_outline,
        title: 'Ayuda',
        page: const HelpScreen(),
      ),
    ],
  ),
),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabecera
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Gastos', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  Text('Ingresos', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              
              // Selectores de Fecha
              Row(
                children: [
                  _buildDropdown('Julio'),
                  const SizedBox(width: 10),
                  _buildDropdown('2026'),
                ],
              ),
              const SizedBox(height: 40),
              
              SizedBox(
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 75, 
                        sections: [
                          PieChartSectionData(color: Colors.greenAccent[200], value: 35, radius: 25, showTitle: false),
                          PieChartSectionData(color: Colors.red[400], value: 25, radius: 25, showTitle: false),
                          PieChartSectionData(color: Colors.pink[300], value: 25, radius: 25, showTitle: false),
                          PieChartSectionData(color: Colors.purple[300], value: 15, radius: 25, showTitle: false),
                        ],
                      ),
                    ),
                    const Text('\$', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // Botón de nuevo gasto
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const NewExpenseScreen())
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.add, size: 28, color: Colors.black87),
                      SizedBox(width: 10),
                      Text('Nuevo gasto', 
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              
              // Lista de Categorías
              const Text('Gastos por categoría', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              
              //estso sosn auxilare para ver como queda la lista de categorias, luego se reemplazará con los datos reales
              _buildCategoryItem(Colors.greenAccent[200]!, 'Educación'),
              _buildCategoryItem(Colors.purple[300]!, 'Comidas y bebidas'),
              _buildCategoryItem(Colors.pink[300]!, 'Transporte'),
              _buildCategoryItem(Colors.red[400]!, 'Servicios de luz y agua'),
            ],  
          ),
        ),
      ),
    );
  }

  // Widgets auxiliares para mantener el código limpio
  Widget _buildDropdown(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(text, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down, size: 20),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(Color color, String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              CircleAvatar(backgroundColor: color, radius: 14),
              const SizedBox(width: 15),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
              const Text('\$', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        const Divider(color: Colors.black26, height: 1, thickness: 1),
      ],
    );
  }
}
