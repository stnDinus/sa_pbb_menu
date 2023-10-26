import 'package:flutter/material.dart';
import 'package:sa_ppb_menu/data.dart';
import 'package:sa_ppb_menu/halaman_item.dart';

class HalamanMenu extends StatelessWidget {
  final List<ItemMenu> menuImitasi;

  const HalamanMenu({super.key, required this.menuImitasi});
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Padding(
        padding: EdgeInsets.all(7),
        child: ListView(children: [
          Text("Pilih Menu", style: Theme.of(context).textTheme.displaySmall),
          ...menuImitasi
              .map((item) => Hero(
                  tag: item.hashCode,
                  child: Material(
                      child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: Image.asset(
                          item.linkGambar,
                        )),
                    const SizedBox(width: 7),
                    Expanded(
                        flex: 3,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.nama,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                item.deskripsi,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Rp.${item.harga}"),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HalamanItem(item: item)));
                                        },
                                        child: const Text("Pesan")),
                                  ]),
                            ]))
                  ]))))
              .toList()
        ]),
      ));
}
