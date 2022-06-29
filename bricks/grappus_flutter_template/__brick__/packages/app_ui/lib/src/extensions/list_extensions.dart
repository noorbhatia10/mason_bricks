/*
 * Created by Nimish Nandwana on 21/06/2021.
 * Description - 
 */

extension ListExtension<T> on List<T>? {
  bool get isNotNullOrEmpty {
    if (this != null && this!.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool get isNullOrEmpty {
    return !isNotNullOrEmpty;
  }

  List<T> get orEmpty {
    if (isNotNullOrEmpty) {
      return this!;
    }

    return List<T>.empty();
  }
}
