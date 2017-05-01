package org.olc.dto;

import java.io.Serializable;

public class CustUserDto implements Serializable{
	
	public CustUserDto(String id, String name, String address) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
	}

	private String id;
	private String name;
	private String address;
	private String[] delck;

	public CustUserDto() {

	}

	@Override
	public String toString() {
		return "CustUserDto [id=" + id + ", name=" + name + ", address=" + address + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String[] getDelck() {
		return delck;
	}

	public void setDelck(String[] delck) {
		this.delck = delck;
	}
	
	
	

}
