// Queue class represents a job queue that executes jobs one by one
import 'dart:async';

import 'package:quickly/src/dart/queue/job.dart';

class Queue {
  final List<Job<dynamic>> _queue = <Job<dynamic>>[];
  bool _active = false;

  void add<T>(FutureOr<T> Function() task) {
    final Job<T> job = Job<T>(task);
    _queue.add(job);
    _check();
  }

  void cancelAllJobs() {
    _queue.clear();
  }

  void _check() async {
    if (!_active && _queue.isNotEmpty) {
      _active = true;
      final Job<dynamic> job = _queue.removeAt(0);
      job.execute();
      _active = false;
      _check();
    }
  }
}
