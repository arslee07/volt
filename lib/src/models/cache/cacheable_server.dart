part of volt;

class CacheableServer extends MinimalServer implements Cacheable<Ulid, Server> {
  @override
  final IVolt _client;

  CacheableServer._new(this._client, Ulid id) : super._new(id);

  @override
  Future<Server> download() => _client.httpEndpoints.fetchServer(id);

  @override
  Server? getFromCache() => _client.servers[id];

  @override
  FutureOr<Server> getOrDownload() async => getFromCache() ?? await download();
}