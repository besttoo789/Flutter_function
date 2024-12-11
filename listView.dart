class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  //final picsum = 'https://picsum.photo/400/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grouping ListView')),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: 7,
        padding: EdgeInsets.all(15),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('กลุ่ม ${index + 1}', style: TextStyle(fontSize: 22)),
            container(),
            Divider(height: 20)
          ],
        ),
      ),
    );
  }

  Widget container() => Container(
        height: 120,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
        ),
      );
}
