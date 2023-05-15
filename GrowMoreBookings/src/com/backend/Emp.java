package com.backend;

public class Emp {
	String firstName;
	String lastName;
	int ssn;
	String username;
	String password;
	
	public Emp () {
		this.firstName = " ";
		this.lastName = " ";
		this.username = " ";
		this.password = " ";
		this.ssn = 0;
		
	}
	public Emp(String firstName, String lastName, String username, String password , int ssn) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.ssn = ssn;
		this.username = username;
		this.password = password;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	
	public String getFullname() {
		return firstName + " " + lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getSsn() {
		return ssn;
	}
	public void setSsn(int ssn) {
		this.ssn = ssn;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
