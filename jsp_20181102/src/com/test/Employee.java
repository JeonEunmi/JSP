package com.test;

// �ڷ��� Ŭ����
public class Employee {
	// �ʵ� ����
	// ->���, �Է¿� �����ϴ� ��� �׸�
	// ->id, age, first_, last_
	// ->���� �ڷ�, ���� �ĺ���
	private String first_, last;
	private int id, age;
	
	
	// �Ű������� �ִ� ������
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
