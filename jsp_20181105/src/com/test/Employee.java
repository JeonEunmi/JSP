package com.test;

//�ڷ��� Ŭ����
public class Employee {

	//�ʵ� ����
	//->���, �Է¿� �����ϴ� ��� �׸�
	//->id_, age, first_, last_
	//->���� �ڷ�, ���� �ĺ���
	private int id_, age;
	private String first_, last_;

	//�Ű����� �ִ� ������
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
