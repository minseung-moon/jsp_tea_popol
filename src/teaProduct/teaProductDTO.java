package teaProduct;

public class teaProductDTO {
	private String idx;
	private String name;
	private String price;
	private String category;
	private String stock;
	private String description;
	private String OriginalFilename;
	private String SaveFilename;
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOriginalFilename() {
		return OriginalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		OriginalFilename = originalFilename;
	}
	public String getSaveFilename() {
		return SaveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		SaveFilename = saveFilename;
	}
	
}
