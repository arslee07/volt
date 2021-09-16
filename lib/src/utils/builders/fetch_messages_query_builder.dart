part of volt;

// TODO: test it plsss
class FetchMessagesQueryBuilder extends Builder<RawApiMap> {
  Ulid? _nearby;

  MessageSortDirection _sortDirection = MessageSortDirection.latest;
  set sortDirection(MessageSortDirection direction) =>
      _sortDirection = direction;

  bool? _includeUsers;
  set includeUsers(bool? value) => _includeUsers = value;

  Ulid? _before;
  set before(Ulid? value) => _before == null ? value : null;

  Ulid? _after;
  set after(Ulid? value) => _after == null ? value : null;

  int? _limit;
  set limit(int? value) =>
      _limit = value == null ? max(min(value!, 100), 1) : null;

  FetchMessagesQueryBuilder();

  factory FetchMessagesQueryBuilder.nearby(
    Ulid nearby, {
    MessageSortDirection sortDirection = MessageSortDirection.latest,
    bool? includeUsers,
    int? limit,
  }) {
    // on nearby before after and sort will be ignored
    return FetchMessagesQueryBuilder()
      .._nearby = nearby
      ..includeUsers = includeUsers
      ..sortDirection = sortDirection
      ..limit = limit;
  }

  @override
  RawApiMap build() {
    return {
      if (_limit != null && _nearby == null) 'limit': _limit,
      if (_before != null && _nearby == null) 'before': _before.toString(),
      if (_after != null && _nearby == null) 'after': _after.toString(),
      'sort': _sortDirection.value,
      if (_nearby != null) 'nearby': _nearby.toString(),
      if (_includeUsers != null) 'include_users': _includeUsers,
    };
  }
}

class MessageSortDirection extends Enum<String> {
  static const latest = MessageSortDirection._create('Latest');
  static const oldest = MessageSortDirection._create('Oldest');

  const MessageSortDirection._create(String val) : super(val);
}
