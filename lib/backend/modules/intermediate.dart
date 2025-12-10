import '../course_models.dart';

final List<Course> intermediateCourses = [
  Course(
    courseId: 'data_analytics_intermediate_clean',
    title: 'Data Analytics – Intermediate',
    description:
        'Intermediate module covering data collection methods, cleaning, exploratory data analysis, visualization, and basic statistical concepts.',
    difficultyLevel: 'Intermediate',
    modules: [
      Module(
        moduleId: 'data_analytics_intermediate_ch1',
        title: 'Data Collection, Cleaning, and Exploratory Analysis',
        difficultyLevel: 'Intermediate',
        summary: '''
This module expands on the essential processes used in preparing and analyzing data.

Topics include:
• Primary and secondary data collection methods  
• The importance of evaluating data sources for accuracy and relevance  
• Data cleaning techniques for handling missing values, inconsistencies, and duplicates  
• Exploratory Data Analysis (EDA) for identifying trends, patterns, and anomalies  
• Introduction to data visualization and selecting appropriate chart types  
• Basic statistical concepts such as mean, median, mode, variance, standard deviation, and correlation  

The module strengthens analytical skills by building a deeper understanding of how data is prepared and explored before advanced modeling.
''',
        content:
            'A detailed discussion of how data is gathered, cleaned, examined, and summarized. It explains the role of reliable data collection, the necessity of removing errors, the purpose of exploratory analysis, and how visualization and statistics support meaningful interpretation of information.',
        youtubeUrl: 'https://www.youtube.com/watch?v=a4KiExvYJKo',
        pdfUrl:
            'https://drive.google.com/uc?export=download&id=1RYc5Dc_t-_2fXnmyBKiqnwuBcraZKVj4',
      ),
    ],
  ),
];
