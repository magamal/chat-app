class DbActionResult {
  final String actionName;
  final dynamic result;
  final Exception? exception;
  final bool isSuccess;

  DbActionResult._(this.actionName, this.result, this.isSuccess, this.exception);

  factory DbActionResult.success(actionName, result) =>
      DbActionResult._(actionName, result, true, null);

  factory DbActionResult.error(actionName, exception) =>
      DbActionResult._(actionName, null, false, exception);
}