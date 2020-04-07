package musicStore.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import musicStore.biz.GenreBiz;
import musicStore.entity.Genre;
import musicStore.mapper.GenreMapper;
@Service
public class GenreBizImpl implements GenreBiz{
	@Autowired
	private GenreMapper genredb;

	@Override
	public List<Genre> findAll() {
		return genredb.findAll();
	}
	

}
