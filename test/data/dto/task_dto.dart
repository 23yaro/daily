import 'package:daily/data/dto/task_dto.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeTaskDTO extends Fake implements TaskDTO {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
