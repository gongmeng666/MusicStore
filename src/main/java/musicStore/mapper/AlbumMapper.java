package musicStore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import musicStore.entity.Album;


public interface AlbumMapper {
	List<Album> findAll();
	void add(Album album);
	Album fetchById(int id);
	void update(Album album);
	List<Album> findAlbums(@Param("genreId")int genreId); 
	List<Album> findAlbumsPagings(@Param("cid")int cid, @Param("title")String title, @Param("startRow")int startRow, @Param("maxRows")int maxRows);
	int fetchAlbumRows(@Param("cid")int cid,@Param("title")String title);
	
}
