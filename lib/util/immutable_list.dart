/// `ImmutableList<T>` is our custom list data structure
/// to get rid of the .add() method problem
/// Now, others won't be able to use .add() method that was supplied by
/// List<T> data structure
class ImmutableList<T> extends Iterable<T> {
  final List<T> _list;

  ImmutableList(this._list);

  @override
  int get length => _list.length;

  T operator [](int index) => _list[index];

  /// Iterator is used for making the class iterable via loops
  @override
  Iterator<T> get iterator => _list.iterator;
}
