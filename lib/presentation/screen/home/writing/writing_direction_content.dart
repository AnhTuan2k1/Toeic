
class WritingDirectionContent {
  static String getTitle(String part){
    switch(part){
      case 'q15':
        return _Question15.title;
      case 'q67':
        return _Question67.title;
      case 'q8':
        return _Question8.title;
      default:
        return '';
    }
  }
  static String getContent(String part){
    switch(part){
      case 'q15':
        return _Question15.content;
      case 'q67':
        return _Question67.content;
      case 'q8':
        return _Question8.content;
      default:
        return '';
    }
  }
  static String getDiretions(String part){
    switch(part){
      case 'q15':
        return _Question15.directions;
      case 'q67':
        return _Question67.directions;
      case 'q8':
        return _Question8.directions;
      default:
        return '';
    }
  }
}

class _Question15 {
  static String title = 'Questions 1-5: Write a sentence base on a apicture';
  static String content = 'Directions: In this part of the test, you will write ONE sentence that is based on a picture. With each picture, you will be given TWO words or phrases that you must use in your sentence. You can change the forms of the words and you can use the words in any order.\n\nYour sentence will be scored on\n• the appropriate use of grammar, and\n• the relevance of the sentence to the picture.\n\nIn this part, you can move to the next question by clicking on Next. If you want to return to a previous question, click on Back.\n\nYou will have eight minutes to complete this part of the test.';
  static String directions = 'Directions: Write ONE sentence based on the picture using TWO words or phrases beneath it. You may change the forms of the words and you may use them in any order.';
}

class _Question67 {
  static String title = 'Questions 6-7: Response to a written request';
  static String content = 'Directions: In this part of the test, you will show how well you can write a response to an e-mail.\n\nYour response will be scored on\n• the quality and variety of your sentences,\n• vocabulary, and\n• organization.\n\nYou will have 10 minutes to read and answer each e-mail.';
  static String directions = 'Directions: Read the e-mail below.';
}

class _Question8 {
  static String title = 'Questions 8: Write a opinion essay';
  static String content = 'Directions: In this part of the test, you will write an essay in response to a question that asks you to state, explain, and support your opinion on an issue. Typically, an effective essay will contain a minimum of 300 words.\n\nYour response will be scored on\n• whether your opinion is supported with reasons and/or examples,\n• grammar,\n• vocabulary, and\n• organization.\n\nYou will have 30 minutes to plan, write, and revise your essay.';
  static String directions = 'Directions: Read the question below. You have 30 minutes to plan, write, and revise your essay. Typically, an effective response will contain a minimun of 300 words.';
}
