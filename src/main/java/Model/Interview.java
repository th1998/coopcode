package Model;

public class Interview {
	private Integer id;
	private Integer languageId;
	private String title;
	private String content;
	private String difficulty;
	private Programinglanguage language;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getLanguageId() {
		return languageId;
	}
	public void setLanguageId(Integer languageId) {
		this.languageId = languageId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public Programinglanguage getLanguage() {
		return language;
	}
	public void setLanguage(Programinglanguage language) {
		this.language = language;
	}
	
}
