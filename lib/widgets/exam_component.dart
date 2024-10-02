import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/cubits/exams_cubit/exams_cubit.dart';
import 'package:dog_license_application/models/request/submit_exam_request_model.dart';
import 'package:dog_license_application/models/response/exam_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamComponent extends StatefulWidget {
  final int unitId;
  final List<QuestionResponseModel> questions; // Directly accept a list of questions

  const ExamComponent({
    super.key,
    required this.questions,
    required this.unitId,
  });

  @override
  State<ExamComponent> createState() => _ExamComponentState();
}

class _ExamComponentState extends State<ExamComponent> {
  int currentQuestionIndex = 0;

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  void previousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
      }
    });
  }

  void resetQuiz() {
    setState(() {
      for (var question in widget.questions) {
        question.isAnswered = false;
        question.selectedOption = null;
        for (var option in question.options) {
          option.isSelected = false;
        }
      }
      currentQuestionIndex = 0;
    });
  }

  void submitQuiz() {
    var answers = widget.questions
        .map((q) => Answer(questionId: q.id, optionId: q.selectedOption!.id))
        .toList();
    BlocProvider.of<ExamsCubit>(context).markExamAsCompleted(
      widget.unitId,
      SubmitExamRequestModel(answers: answers),
    );
  }

  @override
  Widget build(BuildContext context) {
    var question = widget.questions[currentQuestionIndex];
    Color titleColor = Colors.black;

    /*
    if (question.isAnswered) {
      if (question.selectedOption?.id == question.correctAnswer.id) {
        titleColor = Colors.green;
      } else {
        titleColor = Colors.red;
      }
    }
    */

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${currentQuestionIndex + 1} ) ${question.text}",
            style: TextStyle(
              fontSize: 18,
              color: titleColor,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 5),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: question.options.length,
          itemBuilder: (context, optionIndex) {
            var option = question.options[optionIndex];
            Color? tileColor;
            Color textColor = Colors.black;

            /*
            if (question.isAnswered) {
              if (option.id == question.correctAnswer.id) {
                tileColor = Colors.green;
                textColor = Colors.white;
              } else if (option.isSelected == true) {
                tileColor = Colors.red;
                textColor = Colors.white;
              }
            }
            */

            return RadioListTile<OptionResponseModel>(
              dense: true,
              fillColor: MaterialStateProperty.all(Colors.black),
              contentPadding: const EdgeInsets.only(left: 16),
              title: Text(
                option.text,
                style: TextStyle(color: textColor, fontStyle: FontStyle.italic),
              ),
              value: option,
              groupValue: question.selectedOption,
              tileColor: tileColor,
              onChanged: (value) {
                      setState(() {
                        question.isAnswered = true;
                        question.selectedOption = value;
                        option.isSelected = true;
                      });
                    },
            );
          },
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: currentQuestionIndex > 0 ? previousQuestion : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(110, 40),
                backgroundColor: kPrimaryColor,
              ),
              child: const Text('Previous', style: TextStyle(color: Colors.white)),
            ),
            if (currentQuestionIndex < widget.questions.length - 1)
              ElevatedButton(
                onPressed: question.isAnswered ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(110, 40),
                  backgroundColor: kPrimaryColor,
                ),
                child: const Text('Next', style: TextStyle(color: Colors.white)),
              )
            else
              ElevatedButton(
                onPressed: question.isAnswered
                    ? () {
                        if (question.isAnswered) submitQuiz();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(110, 40),
                  backgroundColor: kPrimaryColor,
                ),
                child: const Text('Submit', style: TextStyle(color: Colors.white)),
              ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
