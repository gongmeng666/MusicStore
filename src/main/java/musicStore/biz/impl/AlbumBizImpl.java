package musicStore.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import musicStore.biz.AlbumBiz;
import musicStore.entity.Album;
import musicStore.mapper.AlbumMapper;
@Service
public class AlbumBizImpl implements AlbumBiz {
	@Autowired
	private AlbumMapper albumdb;
		
	@Override
	public List<Album> findAll() {
		return albumdb.findAll();
	}

	@Override
	public void add(Album album) {
		albumdb.add(album);
		
	}

	@Override
	public Album fetchById(int id) {
		return albumdb.fetchById(id);
	}

	@Override
	public void update(Album album) {
		// TODO Auto-generated method stub
		albumdb.update(album);
	}

	@Override
	public List<Album> findAlbumsPagings(int cid, String title, int startRow, int maxRows) {
		// TODO Auto-generated method stub
		return albumdb.findAlbumsPagings(cid, title, startRow, maxRows);
	}

	@Override
	public int fetchAlbumRows(int cid, String title) {
		return albumdb.fetchAlbumRows(cid, title);
	}

	@Override
	public List<Album> findAlbums(int genreId) {
		return albumdb.findAlbums(genreId);
	}


}
