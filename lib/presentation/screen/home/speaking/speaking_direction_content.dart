
class SpeakingDirectionContent {
  static String getTitle(String part){
    switch(part){
      case 'q12':
        return _Question12.title;
      case 'q34':
        return _Question34.title;
      case 'q57':
        return _Question57.title;
      case 'q810':
        return _Question810.title;
      case 'q11':
        return _Question11.title;
      default:
        return '';
    }
  }
  static String getContent(String part){
    switch(part){
      case 'q12':
        return _Question12.content;
      case 'q34':
        return _Question34.content;
      case 'q57':
        return _Question57.content;
      case 'q810':
        return _Question810.content;
      case 'q11':
        return _Question11.content;
      default:
        return '';
    }
  }
}

class _Question12 {
  static String title = 'Questions 1–2: Read a text aloud';
  static String content = 'In this part of the test, you will read aloud the text on the screen. You will have 45 seconds to prepare. Then you will have 45 seconds to read the text aloud.';
}

class _Question34 {
  static String title = 'Questions 3–4: Describe a picture';
  static String content = ' In this part of the test, you will describe the picture on your screen in as much detail as you can. You will have 45 seconds to prepare your response. Then you will have 30 seconds to speak about the picture.';
}

class _Question57 {
  static String title = 'Questions 5–7: Respond to questions';
  static String content = ' In this part of the test, you will answer three questions. You will have three seconds to prepare after you hear each question. You will have 15 seconds to respond to Questions 5 and 6, and 30 seconds to respond to Question 7.';
}

class _Question810 {
  static String title = 'Questions 8–10: Respond to questions using information provided';
  static String content = 'In this part of the test, you will answer three questions based on the information provided. You will have 45 seconds to read the information before the questions begin. You will have three seconds to prepare and 15 seconds to respond to Questions 8 and 9. You will hear Question 10 two times. You will have three seconds to prepare and 30 seconds to respond to Question 10.';
}

class _Question11 {
  static String title = 'Question 11: Express an opinion';
  static String content = 'In this part of the test, you will give your opinion about a specific topic. Be sure to say as much as you can in the time allowed. You will have 45 seconds to prepare. Then you will have 60 seconds to speak.';
}
