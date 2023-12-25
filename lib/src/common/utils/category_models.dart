class DoctorType {
  final String categoryName;
  bool isSelected;

  DoctorType({
    required this.categoryName,
    this.isSelected = false,
  });
}

class QuestionType {
  final String categoryName;
  bool isSelected;

  QuestionType({
    required this.categoryName,
    this.isSelected = false,
  });
}
