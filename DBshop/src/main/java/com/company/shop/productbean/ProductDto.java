package com.company.shop.productbean;

public class ProductDto {
	int productNum;
	String kind;
	int price;
	String name;
	String image;
	String contents;
	int hit;
	String regdate;
	
	
	
	public ProductDto() {
	}

	public ProductDto(int productNum, String kind, int price, String name, String image, String contents, int hit,
			String regdate) {
		this.productNum = productNum;
		this.kind = kind;
		this.price = price;
		this.name = name;
		this.image = image;
		this.contents = contents;
		this.hit = hit;
		this.regdate = regdate;
	}
	
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
