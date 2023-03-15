
import '../application/ServiceStore/searchAlgorithms/binary_search.dart';
import '../application/ServiceStore/service_store.dart';

BinarySearchAlgorithm<Command, int> commandsBinarySearchAlgorithm() {
  return BinarySearchAlgorithm(
    BinarySearchComparator(
      isGreaterThan: (Command command, int id) => command.commandId > id,
      isLessThan: (Command command, int id) => command.commandId < id,
    ),
  );
}

