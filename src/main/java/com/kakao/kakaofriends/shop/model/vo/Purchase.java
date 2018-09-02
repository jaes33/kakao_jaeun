package com.kakao.kakaofriends.shop.model.vo;

import java.util.Arrays;

public class Purchase {
	private int pid;
	private int[] pno;
	private int[] quantity;
	private String name;
	private int phone; 
	private String postcode; 
	private String roadAddress;
	private String detailAddress;
	private String address;
	private String id;
	private String pdate;
	private int amount;
	
	public Purchase() {
		super();
	}

	public Purchase(int pid, int[] pno, int[] quantity, String name, int phone, String postcode, String roadAddress,
			String detailAddress, String address, String id, String pdate, int amount) {
		super();
		this.pid = pid;
		this.pno = pno;
		this.quantity = quantity;
		this.name = name;
		this.phone = phone;
		this.postcode = postcode;
		this.roadAddress = roadAddress;
		this.detailAddress = detailAddress;
		this.address = address;
		this.id = id;
		this.pdate = pdate;
		this.amount = amount;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int[] getPno() {
		return pno;
	}

	public void setPno(int[] pno) {
		this.pno = pno;
	}

	public int[] getQuantity() {
		return quantity;
	}

	public void setQuantity(int[] quantity) {
		this.quantity = quantity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Purchase [pid=" + pid + ", pno=" + Arrays.toString(pno) + ", quantity=" + Arrays.toString(quantity)
				+ ", name=" + name + ", phone=" + phone + ", postcode=" + postcode + ", roadAddress=" + roadAddress
				+ ", detailAddress=" + detailAddress + ", address=" + address + ", id=" + id + ", pdate=" + pdate
				+ ", amount=" + amount + "]";
	}

}
