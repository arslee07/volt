part of volt;

class MessageReceivedEvent extends Event {
  final Message message;

  MessageReceivedEvent._new(Volt client, RawApiMap raw)
      : message = Message._new(client, raw),
        super(raw['type'] as String);
}
