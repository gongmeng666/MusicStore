package musicStore.entity;

public class Genre {
	private int Id;
	private String name;
	private String description;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Genre(int id, String name, String description) {
		super();
		Id = id;
		this.name = name;
		this.description = description;
	}
	public Genre() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
