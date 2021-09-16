part of volt;

class ServerVoiceChannel extends ServerChannel implements MinimalVoiceChannel {
  ServerVoiceChannel._new(IVolt client, RawApiMap raw)
      : super._new(client, raw);

  @override
  Future<void> join() => client.httpEndpoints.joinVoiceChannel(id);
}
