package com.test;

//자료형 클래스
public class Employee {

	//필드 구성
	//->출력, 입력에 관여하는 모든 항목
	//->id_, age, first_, last_
	//->동일 자료, 동일 식별자
	private int id_, age;
	private String first_, last_;

	//매개변수 있는 생성자
	public Employee(int id_, int age, String first_, String last_) {
		this.id_ = id_;
		this.age = age;
		this.first_ = first_;
		this.last_ = last_;
	}

	//getter, setter
	public int getId_() {
		return id_;
	}

	public void setId_(int id_) {
		this.id_ = id_;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getFirst_() {
		return first_;
	}

	public void setFirst_(String first_) {
		this.first_ = first_;
	}

	public String getLast_() {
		return last_;
	}

	public void setLast_(String last_) {
		this.last_ = last_;
	}

}
