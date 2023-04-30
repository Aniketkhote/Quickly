import 'dart:async';

class Job<T> {
  Job(this.task) : completer = Completer<T>();
  final FutureOr<T> Function() task;
  final Completer<T> completer;

  Future<T> get future => completer.future;

  Future<void> execute() async {
    try {
      final T result = await task();
      completer.complete(result);
    } catch (e) {
      completer.completeError(e);
    }
  }
}

class PriorityQueue<T> {
  final Map<int, List<Job<T>>> _queue = <int, List<Job<T>>>{};

  void add(int priority, Job<T> job) =>
      _queue.putIfAbsent(priority, () => <Job<T>>[]).add(job);

  Job<T>? remove() {
    final List<int> priorities = _queue.keys.toList()..sort();
    for (final int priority in priorities) {
      final List<Job<T>>? jobs = _queue[priority];
      if (jobs!.isNotEmpty) {
        final Job<T> job = jobs.removeAt(0);
        if (jobs.isEmpty) {
          _queue.remove(priority);
        }

        return job;
      }
    }
    return null;
  }
}

class ConcurrencyManager {
  ConcurrencyManager(this._maxConcurrency);
  int _concurrency = 0;
  final int _maxConcurrency;

  bool get canExecute => _concurrency < _maxConcurrency;

  void markStarted() => _concurrency++;

  void markCompleted() => _concurrency--;
}

class JobExecutor<T> {
  JobExecutor(this._concurrencyManager);
  final PriorityQueue<T> _queue = PriorityQueue<T>();
  final ConcurrencyManager _concurrencyManager;
  bool _running = false;

  void add(int priority, FutureOr<T> Function() task) {
    final Job<T> job = Job<T>(task);
    _queue.add(priority, job);
    _check();
  }

  void cancelAllJobs() => _queue._queue.clear();

  Future<void> _check() async {
    if (_running || _queue._queue.isEmpty) {
      return;
    }

    final Job<T>? job = _queue.remove();
    _running = true;
    _concurrencyManager.markStarted();
    await job?.execute();
    _concurrencyManager.markCompleted();
    _running = false;
    _check();
  }
}

class Queue<T> {
  Queue(int maxConcurrency)
      : _executor = JobExecutor<T>(ConcurrencyManager(maxConcurrency));
  final JobExecutor<T> _executor;

  void add(int priority, FutureOr<T> Function() task) =>
      _executor.add(priority, task);

  void cancelAllJobs() => _executor.cancelAllJobs();
}
