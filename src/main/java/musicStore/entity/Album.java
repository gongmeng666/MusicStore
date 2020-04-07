package musicStore.entity;

import java.sql.Date;

public class Album {
	private int Id; 
	private Genre genre;
	private int genreId;
	private String artist;
	private String title ;
	private float price ;
	private int stock ;
	private Date dateReleased ;
	private String description ;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public Genre getGenre() {
		return genre;
	}
	public void setGenre(Genre genre) {
		this.genre = genre;
	}
	public int getGenreId() {
		return genreId;
	}
	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Date getDateReleased() {
		return dateReleased;
	}
	public void setDateReleased(Date dateReleased) {
		this.dateReleased = dateReleased;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Album(int id, Genre genre, int genreId, String artist, String title, float price, int stock,
			Date dateReleased, String description) {
		super();
		Id = id;
		this.genre = genre;
		this.genreId = genreId;
		this.artist = artist;
		this.title = title;
		this.price = price;
		this.stock = stock;
		this.dateReleased = dateReleased;
		this.description = description;
	}
	public Album() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
