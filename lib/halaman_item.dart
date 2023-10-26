import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sa_ppb_menu/data.dart';
import 'package:sa_ppb_menu/halaman_ceckout.dart';

class HalamanItem extends StatefulWidget {
  final ItemMenu item;
  final TextEditingController jmlPesanController;

  HalamanItem({super.key, required this.item})
      : jmlPesanController = TextEditingController();

  @override
  State<StatefulWidget> createState() => _HalamanItemState();
}

class _HalamanItemState extends State<HalamanItem> {
  int jmlPesan = 0;

  @override
  void initState() {
    super.initState();
    widget.jmlPesanController.text = 0.toString();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(7),
          child: Hero(
              tag: widget.item.hashCode,
              child: Material(
                  child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Image.asset(
                        widget.item.linkGambar,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    height: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.nama,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(widget.item.deskripsi),
                      const SizedBox(
                        height: 7,
                      ),
                      Text("${widget.item.harga}"),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        padding: const EdgeInsets.all(7),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          const CircleBorder()),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(0)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        --jmlPesan;
                                        jmlPesan =
                                            (jmlPesan < 0) ? 0 : jmlPesan;
                                      });
                                      widget.jmlPesanController.text =
                                          jmlPesan.toString();
                                    },
                                    child: const Icon(Icons.remove),
                                  ),
                                  SizedBox(
                                      width: 50,
                                      child: TextField(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true,
                                        ),
                                        controller: widget.jmlPesanController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            jmlPesan = int.tryParse(value) ?? 0;
                                          });
                                        },
                                      )),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          const CircleBorder()),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(0)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        ++jmlPesan;
                                      });
                                      widget.jmlPesanController.text =
                                          jmlPesan.toString();
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                              Text("${jmlPesan * widget.item.harga}")
                            ]),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ))),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => HalamanCheckout(
                                            item: widget.item,
                                            jmlPesan: jmlPesan)));
                              },
                              child: const Text("Pesan"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )))));
}
