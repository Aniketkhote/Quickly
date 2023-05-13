import 'dart:async';

class Job<T> {
  /// Represents a job that can be executed.
  ///
  /// The [task] is a function that returns a [Future] or [FutureOr] result.
  /// The [onComplete] callback, if provided, is invoked when the job is completed
  /// with the result value as the parameter.
  Job(this.task, {this.onComplete}) : completer = Completer<T>();

  final FutureOr<T> Function() task;
  final Completer<T> completer;
  final void Function(T)? onComplete;

  /// Returns a [Future] representing the completion of the job.
  Future<T> get future => completer.future;

  /// Executes the job's task and completes the [completer] accordingly.
  Future<void> execute() async {
    try {
      final T result = await task();
      completer.complete(result);
      onComplete?.call(result);
    } catch (e) {
      completer.completeError(e);
    }
  }
}

class PriorityQueue<T> {
  final Map<int, List<Job<T>>> _queue = <int, List<Job<T>>>{};

  /// Adds a job with the given [priority] to the priority queue.
  ///
  /// If a list for the given priority doesn't exist, a new list is created
  /// and the job is added to it. Otherwise, the job is added to the existing list.
  void add(int priority, Job<T> job) =>
      _queue.putIfAbsent(priority, () => <Job<T>>[]).add(job);

  /// Removes and returns the highest-priority job from the priority queue.
  ///
  /// The highest-priority job is determined by sorting the priorities in
  /// ascending order and removing the first job from the list with the
  /// lowest priority value.
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
  /// Manages the concurrency level for job execution.
  /// The [_maxConcurrency] parameter determines the maximum number of jobs that can be executed concurrently.
  ConcurrencyManager(this._maxConcurrency);

  int _concurrency = 0;
  final int _maxConcurrency;

  /// Returns `true` if a new job can be executed, i.e., the current concurrency level is less than the maximum allowed.
  bool get canExecute => _concurrency < _maxConcurrency;

  /// Marks the start of a job execution.
  void markStarted() => _concurrency++;

  /// Marks the completion of a job execution.
  void markCompleted() => _concurrency--;
}

class JobExecutor<T> {
  JobExecutor(this._concurrencyManager);

  /// The priority queue to store jobs based on priority.
  final PriorityQueue<T> _queue = PriorityQueue<T>();

  /// The concurrency manager to track the number of running jobs.
  final ConcurrencyManager _concurrencyManager;

  /// Indicates whether the executor is currently running jobs.
  bool _running = false;

  /// The default priority value used when adding jobs without specifying a priority.
  static const int _defaultPriority = 0;

  /// Adds a new job to the executor with an optional completion callback.
  ///
  /// The [task] parameter is a function that represents the job to be executed.
  /// The [onComplete] parameter is an optional callback that will be invoked when the job is completed.
  void addJob(FutureOr<T> Function() task, {void Function(T)? onComplete}) {
    final Job<T> job = Job<T>(task, onComplete: onComplete);
    _queue.add(_defaultPriority, job);
    _check();
  }

  /// Cancels all jobs in the executor.
  void cancelAllJobs() => _queue._queue.clear();

  /// Waits for all jobs in the executor to complete.
  Future<void> waitForCompletion() async {
    if (_running) {
      await _queue.remove()?.future;
      await waitForCompletion();
    }
  }

  /// Internal method to check and execute jobs from the queue.
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
  /// A queue that manages the execution of jobs with limited concurrency.
  ///
  /// The `maxConcurrency` parameter determines the maximum number of jobs
  /// that can execute concurrently. When jobs are added to the queue, they
  /// will be executed in the order of their priority, respecting the
  /// concurrency limit.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final Queue<int> queue = Queue<int>(5);
  ///
  /// void main() {
  ///   queue.addJob(() => performTask(1));
  ///   queue.addJob(() => performTask(2));
  ///   queue.addJob(() => performTask(3));
  /// }
  ///
  /// Future<void> performTask(int id) async {
  ///   // Task implementation
  ///   print('Task $id started');
  ///   await Future.delayed(Duration(seconds: 2));
  ///   print('Task $id completed');
  /// }
  /// ```
  Queue(int maxConcurrency)
      : _executor = JobExecutor<T>(ConcurrencyManager(maxConcurrency));
  final JobExecutor<T> _executor;

  /// Adds a new job to the queue with an optional completion callback.
  ///
  /// The `task` parameter is a function that represents the job to be executed.
  /// The function should return a `Future` or a value that can be wrapped in a `Future`.
  ///
  /// The optional `onComplete` parameter is a callback function that will be
  /// invoked when the job completes. It will receive the result of the job as
  /// its parameter.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// queue.addJob(() => performTask(1), onComplete: (result) {
  ///   print('Job 1 completed with result: $result');
  /// });
  /// ```
  void addJob(FutureOr<T> Function() task, {void Function(T)? onComplete}) =>
      _executor.addJob(task, onComplete: onComplete);

  /// Cancels all the jobs in the queue, preventing them from executing.
  void cancelAllJobs() => _executor.cancelAllJobs();

  /// Waits for all jobs in the queue to complete.
  ///
  /// This method returns a `Future` that completes when all jobs in the queue
  /// have finished executing. The `Future` resolves successfully if all jobs
  /// complete successfully, or with an error if any of the jobs fail.
  Future<void> waitForCompletion() => _executor.waitForCompletion();
}
