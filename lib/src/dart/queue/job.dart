import 'dart:async';

// Job class represents a single unit of work to be done
class Job<T> {
  Job(this.job) : _completer = Completer<T>();
  final FutureOr<T> Function() job;
  final Completer<T> _completer;

  Future<T> get future => _completer.future;

  Future<void> execute() async {
    try {
      final T result = await job();
      _completer.complete(result);
    } catch (e) {
      _completer.completeError(e);
    }
  }
}
