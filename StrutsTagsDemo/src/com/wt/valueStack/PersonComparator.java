package com.wt.valueStack;

import java.util.Comparator;

public class PersonComparator implements Comparator<Person>{

	@Override
	public int compare(Person person1, Person person2) {
		
		// ����Ϊ�ƶ��������ֽ�������Ĺ���
		return person1.getName().compareTo(person2.getName());
	}

}