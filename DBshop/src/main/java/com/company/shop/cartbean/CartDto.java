package com.company.shop.cartbean;

public class CartDto {
	int cartNum;
	String id;
	int prodnum;
	int quantity;
	String cartDate;
	
	
	
	public CartDto() {
		super();
	}

	public CartDto(int cartNum, String id, int prodnum, int quantity, String cartDate) {
		super();
		this.cartNum = cartNum;
		this.id = id;
		this.prodnum = prodnum;
		this.quantity = quantity;
		this.cartDate = cartDate;
	}
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProdnum() {
		return prodnum;
	}
	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getCartDate() {
		return cartDate;
	}
	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}
	
	
}
