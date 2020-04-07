package musicStore.biz;

import java.util.List;

import musicStore.entity.Genre;

public interface GenreBiz {
	List<Genre> findAll();
}
