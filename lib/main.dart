import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SliverAppBar Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SliverAppBarExample(),
    );
  }
}

class SliverAppBarExample extends StatelessWidget {
  const SliverAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // CustomScrollView is required to use Sliver widgets
        slivers: [
          // This is the main SliverAppBar widget
          SliverAppBar(
            // EXPANDABLE HEIGHT - Controls how tall the app bar can expand
            expandedHeight: 200.0,

            // FLEXIBLE SPACE - The content that expands and contracts
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'SliverAppBar Demo',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purple, Colors.blue, Colors.teal],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.flutter_dash,
                    size: 80,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
              centerTitle: true,
            ),

            // PINNED - Keeps the collapsed app bar visible when scrolling
            pinned: true,

            // FLOATING - App bar appears when scrolling up, even if not at top
            floating: true,

            // SNAP - Works with floating to make app bar snap into view quickly
            snap: true,

            // BACKGROUND COLOR - Color when collapsed
            backgroundColor: Colors.deepPurple,

            // ACTIONS - Buttons on the right side of the app bar
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Search pressed!')));
                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Menu pressed!')));
                },
              ),
            ],

            // LEADING - Widget on the left side (usually back button or menu)
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Menu opened!')));
              },
            ),

            // ELEVATION - Shadow depth when collapsed
            elevation: 10.0,

            // FORCE ELEVATED - Always show shadow, even when expanded
            forceElevated: true,
          ),

          // CONTENT BELOW THE SLIVER APP BAR
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 100,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Item ${index + 1}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Scroll to see SliverAppBar behavior',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 20, // Number of items in the list
            ),
          ),
        ],
      ),

      // FLOATING ACTION BUTTON (Optional - shows it works with SliverAppBar)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'FAB pressed! Notice how it stays in place while scrolling.',
              ),
            ),
          );
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
    );
  }
}

// ADDITIONAL EXAMPLE: Different SliverAppBar Configurations
class SliverAppBarVariations extends StatelessWidget {
  const SliverAppBarVariations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverAppBar Variations'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          // Button to show different SliverAppBar configurations
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BasicSliverAppBar()),
            ),
            child: Text('Basic SliverAppBar (No Expansion)'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FloatingOnlyAppBar()),
            ),
            child: Text('Floating Only (Not Pinned)'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PinnedOnlyAppBar()),
            ),
            child: Text('Pinned Only (Not Floating)'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImageBackgroundAppBar()),
            ),
            child: Text('Image Background SliverAppBar'),
          ),
        ],
      ),
    );
  }
}

// BASIC SLIVER APP BAR (No expansion)
class BasicSliverAppBar extends StatelessWidget {
  const BasicSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Basic SliverAppBar'),
            backgroundColor: Colors.red,
            // No expandedHeight - behaves like regular AppBar
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              for (int i = 0; i < 20; i++)
                ListTile(
                  title: Text('Item $i'),
                  subtitle: Text(
                    'This is a basic SliverAppBar without expansion',
                  ),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}

// FLOATING ONLY APP BAR
class FloatingOnlyAppBar extends StatelessWidget {
  const FloatingOnlyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Floating Only'),
            backgroundColor: Colors.green,
            expandedHeight: 150.0,
            floating: true, // Appears when scrolling up
            pinned: false, // Disappears when scrolling down
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.green.withOpacity(0.8),
                child: Center(child: Text('Scroll down to hide, up to show')),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              for (int i = 0; i < 20; i++)
                ListTile(
                  title: Text('Item $i'),
                  subtitle: Text('Floating: appears when scrolling up'),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}

// PINNED ONLY APP BAR
class PinnedOnlyAppBar extends StatelessWidget {
  const PinnedOnlyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Pinned Only'),
            backgroundColor: Colors.orange,
            expandedHeight: 150.0,
            floating: false, // Doesn't appear when scrolling up
            pinned: true, // Always stays visible when collapsed
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.orange.withOpacity(0.8),
                child: Center(child: Text('Always visible when collapsed')),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              for (int i = 0; i < 20; i++)
                ListTile(
                  title: Text('Item $i'),
                  subtitle: Text('Pinned: always visible when collapsed'),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}

// IMAGE BACKGROUND APP BAR
class ImageBackgroundAppBar extends StatelessWidget {
  const ImageBackgroundAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Image Background'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade300,
                      Colors.blue.shade600,
                      Colors.blue.shade900,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Simulated image with pattern
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://picsum.photos/400/250'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Overlay for better text readability
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.4),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
            floating: true,
            backgroundColor: Colors.blue.shade800,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              for (int i = 0; i < 20; i++)
                ListTile(
                  title: Text('Item $i'),
                  subtitle: Text('SliverAppBar with image background'),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
