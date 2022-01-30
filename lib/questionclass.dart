class QuestionClass {

  List <String> questionClassList = [];
  List <bool> answerClassList = [];


  void addClassQuestion({q= String, a= bool}){
    print('----- addClassQuestion is called.');

    questionClassList.add(q);
    answerClassList.add(a);

  }



  void testFunc(){
    print('----- testFunc in QuestionClass is called.');

  }

}