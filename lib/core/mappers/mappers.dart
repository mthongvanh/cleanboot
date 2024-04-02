/// Maps a model to an entity and vice-versa
abstract class Mapper<M, E> {
  /// Maps an entity to a model
  M fromEntity(final E entity);

  /// Maps a model to an entity
  E toEntity(final M model);
}