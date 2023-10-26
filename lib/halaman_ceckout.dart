import 'package:flutter/material.dart';
import 'package:sa_ppb_menu/data.dart';

class HalamanCheckout extends StatelessWidget {
  final ItemMenu item;
  final int jmlPesan;

  const HalamanCheckout(
      {super.key, required this.item, required this.jmlPesan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        Text(
                          "Pemesanan",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(item.nama),
                        Text("${item.harga} x $jmlPesan"),
                        const Text("Berhasil disimpan"),
                        const Text("Total Bayar:"),
                        Text("${item.harga * jmlPesan}"),
                      ]),
                      ElevatedButton(
                          child: const Text("Kembali ke menu"),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ]))));
  }
}
