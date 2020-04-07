package musicStore.mapper;

import java.util.List;

import musicStore.entity.Genre;

public interface GenreMapper {
	List<Genre> findAll();
}
