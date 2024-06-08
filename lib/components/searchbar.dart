import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function()? onPressed; 

  const SearchField({
    super.key,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 5,
      ),
      child: Row(
        children: [

          //Tombol Search
          IconButton(
            onPressed: onPressed, 
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),

          //Textfield
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
              ),
            ),
          ),

          //Garis ala - ala
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),

          //Tombol Setting
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}