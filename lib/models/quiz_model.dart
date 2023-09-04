import 'answers_model.dart';

class QuizModel {
  String question;
  List<AnswerModel> answers;
  QuizModel({required this.question, required this.answers});
}

List<QuizModel> quizList = [
  QuizModel(question: 'ما هو نوع الخطر الموجود بالفيديو؟', answers: [
    AnswerModel(answer: 'خطر كيميائي', selected: false, trueOrFalse: false),
    AnswerModel(answer: 'خطر فيزيائي', selected: false, trueOrFalse: false),
    AnswerModel(answer: 'خطر ميكانيكي', selected: false, trueOrFalse: false),
    AnswerModel(answer: 'خطر بيولوجي', selected: false, trueOrFalse: true)
  ]),

  QuizModel(question: 'ما هو السبب الجذري؟', answers: [
    AnswerModel(answer: 'اهمال من العامل ناتج عن التسرع', selected: false, trueOrFalse: false),
    AnswerModel(answer: 'مواعيد الكافتيريا غير كافيه لاستقبال العمال', selected: false, trueOrFalse: false),
    AnswerModel(answer: 'خطة الصيانة الوقائية غير مفعله', selected: false, trueOrFalse: true),
    AnswerModel(answer: 'تدريب العاملين لا يتم بشكل جيد', selected: false, trueOrFalse: false)
  ]),

];
