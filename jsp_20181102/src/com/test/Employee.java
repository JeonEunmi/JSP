package com.test;

// 자료형 클래스
public class Employee {
	// 필드 구성
	// ->출력, 입력에 관여하는 모든 항목
	// ->id, age, first_, last_
	// ->동일 자료, 동일 식별자
	private String first_, last;
	private int id, age;
	
	
	// 매개변수가 있는 생성자
	public Employee() {
		
	}

	public Employee(int id, int age, String first_, String last) {
		this.id = id;
		this.age = age;
		this.first_ = first_;
		this.last = last;
	}

	
	// getter, setter
	public int getId_() {
		return this.id;
	}

	public void setId_(int id) {
		this.id = id;
	}

	public String getFirst() {
		return this.first_;
	}

	public void setFirst(String first_) {
		this.first_ = first_;
	}

	public String getLast() {
		return this.last;
	} 

	public void setLast(String last) {
		this.last = last;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	
}
