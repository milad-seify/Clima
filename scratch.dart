import 'dart:io';

//example for async and await
void main() {
  performTasks();
}

void performTasks() async {
  task1();
  // print(task2());
  String result = await task2();
  task3(result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result = 'null';
  Duration duration = Duration(seconds: 3);
  //sleep(duration);
  await Future.delayed(duration, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String data2) {
  String result = 'task 3 data';
  print('Task 3 complete with $data2');
}
