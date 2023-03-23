import 'package:demo_lakes/widgets/bottom_bar_item_icon.dart';
import 'package:demo_lakes/widgets/place.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final bool isDarkTheme;
  final VoidCallback onChangeTheme;

  const MyHomePage({
    super.key,
    required this.title,
    required this.isDarkTheme,
    required this.onChangeTheme,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Widget> _places = [
    Place(
      title: "Emerald Lake",
      subtitle: "Yoho National Park, British Columbia",
      description:
          "Emerald Lake is one of the most admired destinations in Yoho National Park, with an unmatched diversity of both activities and landscapes suited to the enthusiastic traveler. The hike around the lake, clocking in at about an hour, is one of the least strenuous but most rewarding in the park.",
      score: 41,
      imagesUrl: [
        "https://i.etsystatic.com/17438404/r/il/69098c/2039795046/il_fullxfull.2039795046_o1e7.jpg",
        "https://britishcolumbia.com/wp-content/uploads/2013/09/emerald-lake-yoho-national-park-british-columbia-730x485.jpg",
        "http://banffandbeyond.com/wp-content/uploads/2015/07/boat-at-emerald-lake-in-yoho-national-park-bc-600x400.jpg",
        "https://www.theworldisacircus.com/wp-content/uploads/2018/02/IMG_5680.jpg"
      ],
    ),
    Place(
      title: "El Cielo Biosphere Reserve",
      subtitle: "Sierra Madre Oriental, Tamaulipas, Mexico",
      description:
          "Located between the Neotropical biogeographical region, the biosphere reserve is situated in the ‘Sierra de Cucharas’, a mountainous chain derived from the large Sierra Madre Chain. It is one of the most ecologically rich and diverse places of Mexico. It comprises 14 vegetation types, dominated by the tropical sclerophyllous forest.",
      score: 50,
      imagesUrl: [
        "https://cdn.milenio.com/uploads/media/2021/04/10/el-cielo-en-tamaulipas-recupera-4.jpg",
        "https://cdn.milenio.com/uploads/media/2021/04/10/el-cielo-en-tamaulipas-recupera-9.jpg",
        "https://i1.wp.com/granturismomexico.com/wp-content/uploads/2017/02/cielo-tamaulipas.jpg",
        "https://www.mexicodesconocido.com.mx/wp-content/uploads/2019/04/Tamaulipas-Reserva-de-la-Biosfera-El-Cielo-San-Jose-PJ_MG_6213.jpg"
      ],
    ),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bottomBarTheme = Theme.of(context).bottomAppBarTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: widget.onChangeTheme,
              icon:
                  Icon(widget.isDarkTheme ? Icons.light_mode : Icons.dark_mode))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: _places.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: BottomBarItemIcon('canada.png'),
            label: 'Canada',
          ),
          BottomNavigationBarItem(
            icon: BottomBarItemIcon('mexico.png'),
            label: 'México',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: bottomBarTheme.color,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
