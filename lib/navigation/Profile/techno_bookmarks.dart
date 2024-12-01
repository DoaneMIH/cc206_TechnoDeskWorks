import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  final List<Job> jobs = [
    Job(
      title: "Graphic Designer",
      rate: 500,
      description: "We are looking for a skilled Graphic Designer to join our team. As a Graphic Designer, you will be responsible for creating visual concepts that communicate ideas to inspire, inform, and captivate our audience. You should have a keen eye for detail and a creative mindset.",
      skills: ["Adobe Photoshop", "Illustrator", "Designing"],
    ),
    Job(
      title: "Web Developer",
      rate: 600,
      description: "We are looking for a skilled UI/UX developer to design and develop the frontend of our website, which is a short film OTT platform. The ideal candidate should have experience in creating user-centric designs for web interfaces and an in-depth understanding of user experience principles. The responsibilities include creating wireframes, prototypes, and visually appealing designs that align with our brand and business goals.",
      skills: ["Flutter", "HTML", "CSS", "JavaScript"],
    ),
    Job(
      title: "UI/UX Designer",
      rate: 550,
      description: "We are seeking a talented and experienced WordPress Website Redesign Specialist to revamp our existing website. The ideal candidate will have a proven track record of delivering high-quality, custom website designs with a strong focus on user experience. The goal is to create a visually appealing and intuitive website that aligns with our brand identity and engages our target audience effectively.",
      skills: ["Sketch", "Figma", "Wireframing"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JOBS YOU SAVED',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(57, 105, 144, 1),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 237, 198, 136),
                Color.fromARGB(255, 246, 217, 173),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     
                      Text(
                        job.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      Text(
                        '₱${job.rate}/hr',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  Text(
                    job.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  
                  Wrap(
                    spacing: 8,
                    children: job.skills
                        .map((skill) => Chip(label: Text(skill)))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                      IconButton(
                        onPressed: () {
                          
                        },
                        icon: const Icon(
                          Icons.bookmark_add,
                          color: Colors.blue, 
                        ),
                      ),
                      
                      ElevatedButton(
                        onPressed: () {
                          
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, 
                          foregroundColor: Colors.white,  
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16), 
                        ),
                        child: const Text('Apply'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Job {
  final String title;
  final int rate;
  final String description;
  final List<String> skills;

  Job({
    required this.title,
    required this.rate,
    required this.description,
    required this.skills,
  });
}
