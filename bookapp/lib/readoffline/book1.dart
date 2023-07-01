import 'package:flutter/material.dart';

class book1 extends StatelessWidget {
  const book1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                // boxShadow: [
                //             BoxShadow(
                // color: Colors.grey.,
                // spreadRadius: 1,
                // blurRadius: 15,
                // offset: const Offset(0, 15)
                //             )
                // ]
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'The Bhagwat Gita',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'authorName',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 70),
                      child: Text(
                        '⭐⭐⭐⭐⭐',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  Container(
                          width: 80,
                          height:30,
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                          ),
                          child: const Center(child: Text("Download",style: TextStyle(color: Colors.white),),),
                        ),  
                  ],
                ),
                // const SizedBox(
                //   width: 80,
                // ),
                Image.network(
                  'https://asitis.com/gif/bgcover.jpg',
                  fit: BoxFit.fill,
                  height: 150,
                  width: 130,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'The Bhagavad-gita is universally renowned as the jewel of Indias spiritual wisdom. Spoken by Lord Krishna, the Supreme Personality of Godhead to His intimate disciple Arjuna, the Gitas seven hundred concise verses provide a definitive guide to the science of self realization. No other philosophical or religious work reveals, in such a lucid and profound way, the nature of consciousness, the self, the universe and the Supreme. His Divine Grace A.C. Bhaktivedanta Swami Prabhupada is uniquely qualified to present this English translation and commentary on Bhagavad-gita. He is the worlds foremost Vedic scholar and teacher, and he is also the current representative of an unbroken chain of fully self-realized spiritual masters begining with Lord Krishna Himself. Thus, unlike other editions of the Gita, this one is presented as it is--without the slightest taint of adulteration or personal motivation. This edition is certain to stimulate and enlighten with its ancient yet thoroughly timely message.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
