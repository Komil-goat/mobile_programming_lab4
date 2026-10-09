import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 4 Menu')),
      body: ListView(
        children: [
          ListTile(title: const Text('Task 1: Selection'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Task1Scr()))),
          ListTile(title: const Text('Task 2: Input Fields'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Task2Scr()))),
          ListTile(title: const Text('Task 3: Buttons'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Task3Scr()))),
          ListTile(title: const Text('Task 4: Indicators'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Task4Scr()))),
          ListTile(title: const Text('Task 5: Dialogs'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Task5Scr()))),
          ListTile(title: const Text('Task 6: Sliders'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Task6Scr()))),
          ListTile(title: const Text('Task 7: List'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Task7Scr()))),
          ListTile(title: const Text('Task 8: Grid'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Task8Scr()))),
          ListTile(title: const Text('Task 9: Navigation'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Task9Scr()))),
        ],
      ),
    );
  }
}

class Task1Scr extends StatefulWidget {
  const Task1Scr({super.key});
  @override
  State<Task1Scr> createState() => _Task1ScrState();
}

class _Task1ScrState extends State<Task1Scr> {
  bool darkMode = false;
  bool agreetTms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 1')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: darkMode,
            onChanged: (val) => setState(() => darkMode = val),
          ),
          CheckboxListTile(
            title: const Text('Agree to Terms'),
            value: agreetTms,
            onChanged: (val) => setState(() => agreetTms = val ?? false),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: agreetTms ? () {} : null,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}

class Task2Scr extends StatefulWidget {
  const Task2Scr({super.key});
  @override
  State<Task2Scr> createState() => _Task2ScrState();
}

class _Task2ScrState extends State<Task2Scr> {
  final formKey = GlobalKey<FormState>();
  final emlCtrl = TextEditingController();
  final pswCtrl = TextEditingController();
  bool hidenPsw = true;

  @override
  void dispose() {
    emlCtrl.dispose();
    pswCtrl.dispose();
    super.dispose();
  }

  void submited() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form is valid')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 2')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emlCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Type ur email n1gga';
                  if (!val.contains('@')) return 'Email must have @';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: pswCtrl,
                obscureText: hidenPsw,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(hidenPsw ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => hidenPsw = !hidenPsw),
                  ),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Type ur password n1gga';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: submited,
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task3Scr extends StatefulWidget {
  const Task3Scr({super.key});
  @override
  State<Task3Scr> createState() => _Task3ScrState();
}

class _Task3ScrState extends State<Task3Scr> {
  int cnt = 0;

  void pluss() => setState(() => cnt++);
  void rset() => setState(() => cnt = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter'),
            Text('$cnt', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 16),
            OutlinedButton(onPressed: rset, child: const Text('Reset')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pluss,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Task4Scr extends StatefulWidget {
  const Task4Scr({super.key});
  @override
  State<Task4Scr> createState() => _Task4ScrState();
}

class _Task4ScrState extends State<Task4Scr> {
  bool lodng = false;

  Future<void> strtLod() async {
    setState(() => lodng = true);
    await Future.delayed(const Duration(seconds: 3));
    setState(() => lodng = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Done!'),
          action: SnackBarAction(label: 'Undo', onPressed: () {}),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 4')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: strtLod,
              child: const Text('Start loading'),
            ),
            const SizedBox(height: 32),
            if (lodng) const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class Task5Scr extends StatefulWidget {
  const Task5Scr({super.key});
  @override
  State<Task5Scr> createState() => _Task5ScrState();
}

class _Task5ScrState extends State<Task5Scr> {
  String itmNme = 'My Item';

  void askDlte() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Item?'),
        content: Text('U wanna delete $itmNme?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$itmNme is deleted')),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void opnBotmSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(leading: const Icon(Icons.share), title: const Text('Share with friends'), onTap: () => Navigator.pop(ctx)),
          ListTile(leading: const Icon(Icons.link), title: const Text('Copy link'), onTap: () => Navigator.pop(ctx)),
          ListTile(leading: const Icon(Icons.message), title: const Text('Send msg'), onTap: () => Navigator.pop(ctx)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 5')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: askDlte,
              child: const Text('Delete item'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: opnBotmSheet,
              child: const Text('Share item'),
            ),
          ],
        ),
      ),
    );
  }
}

class Task6Scr extends StatefulWidget {
  const Task6Scr({super.key});
  @override
  State<Task6Scr> createState() => _Task6ScrState();
}

class _Task6ScrState extends State<Task6Scr> {
  double volum = 50;
  String pikedDt = 'No date picked';

  Future<void> pikDt() async {
    final reslt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (reslt != null) {
      setState(() {
        pikedDt = '${reslt.day}/${reslt.month}/${reslt.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 6')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Volume: ${volum.round()}%'),
            Slider(
              value: volum,
              min: 0,
              max: 100,
              divisions: 20,
              label: '${volum.round()}%',
              onChanged: (val) => setState(() => volum = val),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: pikDt,
              child: const Text('Pick Date'),
            ),
            const SizedBox(height: 16),
            Text('Picked date: $pikedDt'),
          ],
        ),
      ),
    );
  }
}

class Task7Scr extends StatefulWidget {
  const Task7Scr({super.key});
  @override
  State<Task7Scr> createState() => _Task7ScrState();
}

class _Task7ScrState extends State<Task7Scr> {
  List<String> itms = List.generate(20, (i) => 'Item num ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 7')),
      body: ListView.builder(
        itemCount: itms.length,
        itemBuilder: (ctx, idx) {
          return Dismissible(
            key: Key(itms[idx]),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) {
              setState(() => itms.removeAt(idx));
            },
            child: ListTile(
              title: Text(itms[idx]),
              leading: CircleAvatar(child: Text('${idx + 1}')),
            ),
          );
        },
      ),
    );
  }
}

class Task8Scr extends StatelessWidget {
  const Task8Scr({super.key});

  final List<Color> clrLst = const [
    Colors.red, Colors.blue, Colors.green, Colors.orange,
    Colors.purple, Colors.teal, Colors.pink, Colors.indigo,
    Colors.amber, Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 8')),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: List.generate(clrLst.length, (i) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImgPrevScr(clr: clrLst[i], num: i + 1),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: clrLst[i],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Img ${i + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ImgPrevScr extends StatelessWidget {
  final Color clr;
  final int num;

  const ImgPrevScr({super.key, required this.clr, required this.num});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prev of Img $num')),
      body: Center(
        child: Container(
          color: clr,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text(
              'Img $num',
              style: const TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}

class Task9Scr extends StatefulWidget {
  const Task9Scr({super.key});
  @override
  State<Task9Scr> createState() => _Task9ScrState();
}

class _Task9ScrState extends State<Task9Scr> {
  int botmIdx = 0;

  final botmScrzz = const [
    Center(child: Text('Home', style: TextStyle(fontSize: 30))),
    Center(child: Text('Search', style: TextStyle(fontSize: 30))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 30))),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task 9'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: const [
            Center(child: Text('Tab 1 content')),
            Center(child: Text('Tab 2 content')),
            Center(child: Text('Tab 3 content')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: botmIdx,
          onTap: (i) => setState(() => botmIdx = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
