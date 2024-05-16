import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 121, 112),
        title: const Text(
          'About',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Christian Barbosa (Developer)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Image.asset(
                      'images/aboutus2.png', // Path to local image asset
                      height: 320,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Introducing Christian Barbosa, a Bachelor of Science in Information Technology (BSIT) Student of Leyte Normal University (LNU), From Sta. Fe, Leyte Philippines, behind the development of this Object Detection, AI Mobile Application. With his curiousity and dedication, he develop this application to brought innovation and functionality in this project, ensuring a seamless user experience and robust performance when it comes to Object Recognition Technology using YOLOv5 image recognition Convolutional Neural Network Algorithms.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Add more cards here as needed
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'images/mobiledev.gif', // Path to local image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Developing an object recognition app was a challenging yet rewarding experience that merged my expertise in mobile development with the intricacies of AI. The journey began with selecting a suitable pre-trained model, which was then optimized using YOLO for efficient on-device processing. Ensuring the app responsiveness required implementing asynchronous processing to keep the UI smooth and interactive while the model ran in the background.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'images/appdev.gif', // Path to local image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Embarking on the development of an object recognition app was a captivating journey that seamlessly blended my passion for mobile technology with the complexity of artificial intelligence.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'images/flutter.gif', // Path to local image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Using Flutter, I developed a cross-platform object recognition app that seamlessly runs on both Android and iOS devices, leveraging its robust widget library and hot reload feature for rapid development and UI refinement. Flutters single codebase significantly reduced development time and ensured a consistent user experience across platforms, allowing for efficient deployment and maintenance.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'images/dev.gif', // Path to local image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Our group is also committed to collaborative teamwork, fostering creativity, and achieving excellence in every project we undertake. With a diverse range of skills and perspectives, we aim to tackle challenges innovatively and deliver impactful solutions. Together, we strive to uphold professionalism, communication, and mutual support to achieve our shared goals efficiently.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'images/github.gif', // Path to local image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Explore my GitHub account, lightdarkmaster, where you will find a diverse portfolio showcasing my expertise in software development, from sleek mobile applications to powerful machine learning projects. With a commitment to innovation and quality, each repository offers insights into my coding style and problem-solving approach, inviting collaboration and inspiration for fellow developers.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      'images/lightdarkmaster.png', // Path to local image asset
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Discover the world of software craftsmanship through my GitHub profile, LightDarkMaster, where meticulously crafted projects reflect my dedication to excellence and passion for coding. From elegant front-end designs to robust back-end solutions, each repository embodies a commitment to pushing boundaries and delivering impactful solutions to real-world problems.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20), // Adding space between card and button
              ElevatedButton(
                onPressed: () {
                  // Replace 'your_link_here' with your actual link
                  String url = 'https://github.com/lightdarkmaster';
                  // Use a package like url_launcher to open the URL
                  // Example:
                  //launch(url);
                },
                child: const Text('Visit GitHub Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
