
import 'package:flutter/material.dart';

class book2 extends StatelessWidget {
  const book2({super.key});

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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mahabharat',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'authorName',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 70),
                      child: Text(
                        '⭐⭐⭐⭐⭐',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(
                //   width: 80,
                // ),
                Image.network(
                  'https://www.worldhistory.org/img/r/p/1000x1200/5519.jpg.webp?v=1685678343',
                  fit: BoxFit.cover,
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
                      'The Mahabharata is an ancient Indian epic where the main story revolves around two branches of a family - the Pandavas and Kauravas - who, in the Kurukshetra War, battle for the throne of Hastinapura. Interwoven into this narrative are several smaller stories about people dead or living, and philosophical discourses. Krishna-Dwaipayan Vyasa, himself a character in the epic, composed it; as, according to tradition, he dictated the verses and Ganesha wrote them down. At 100,000 verses, it is the longest epic poem ever written, generally thought to have been composed in the 4th century BCE or earlier. The events in the epic play out in the Indian subcontinent and surrounding areas. It was first narrated by a student of Vyasa at a snake-sacrifice of the great-grandson of one of the major characters of the story. Including within it the Bhagavad Gita, the Mahabharata is one of the most important texts of ancient Indian, indeed world, literature.The prelude Shantanu, the king of Hastinapur, was married to Ganga (personification of the Ganges) with whom he had a son called Devavrat. Several years later, when Devavrat had grown up to be an accomplished prince, Shantanu fell in love with Satyavati. Her father refused to let her marry the king unless the king promised that Satyavatis son and descendants would inherit the throne. Unwilling to deny Devavrat his rights, Shantanu declined to do so but the prince, on coming to know of the matter, rode over to Satyavatis house, vowed to renounce the throne and to remain celibate throughout his life. The prince then took Satyavati home to the palace so that the king, his father, could marry her. On account of the terrible vow that he taken that day, Devavrat came to be known as Bheeshm. Shantanu was so pleased with his son that he granted to Devavrat the boon of choosing the time of his own death.',
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
