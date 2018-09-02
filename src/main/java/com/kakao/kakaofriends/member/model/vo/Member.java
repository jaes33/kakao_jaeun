package com.kakao.kakaofriends.member.model.vo;

public class Member {
	private String id;
	private String password;
	private String password2;
	private String name;
	private String nickname;
	private int phone;
	private String postcode;
	private String roadAddress;
	private String detailAddress;
	private String address;
	
	public Member() {
		super();		
	}

	public Member(String id, String password, String password2, String name, String nickname, int phone,
			String postcode, String roadAddress, String detailAddress, String address) {
		super();
		this.id = id;
		this.password = password;
		this.password2 = password2;
		this.name = name;
		this.nickname = nickname;
		this.phone = phone;
		this.postcode = postcode;
		this.roadAddress = roadAddress;
		this.detailAddress = detailAddress;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", password2=" + password2 + ", name=" + name
				+ ", nickname=" + nickname + ", phone=" + phone + ", postcode=" + postcode + ", roadAddress="
				+ roadAddress + ", detailAddress=" + detailAddress + ", address=" + address + "]";
	}

}