package com.tech.blog.entities;
import java.sql.*;
public class User {
	private int id;
	private String name;
	private String email;
	private String gender;
	private String about;
	private String password;
	private Timestamp dateTime;
	private String profile;
	
	//constructor
	public User() {
		// TODO Auto-generated constructor stub
	}
	//constructor
	public User(String name,String email,String password,String about,String gender){
		this.name=name;
		this.email=email;
		this.about=about;
		this.password=password;
		this.gender=gender;
		
	}
	//constructor
	public User(int id,String name,String email,String password,String gender,String about,Timestamp dateTime){
		this.id=id;
		this.name=name;
		this.email=email;
		this.gender=gender;
		this.about=about;
		this.password=password;
		this.dateTime=dateTime;
	}
	//getter and setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getDateTime() {
		return dateTime;
	}
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
}
