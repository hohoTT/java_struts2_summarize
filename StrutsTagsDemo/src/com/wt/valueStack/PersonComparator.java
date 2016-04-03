package com.wt.valueStack;

import java.util.Comparator;

public class PersonComparator implements Comparator<Person>{

	@Override
	public int compare(Person person1, Person person2) {
		
		// 以下为制定按照名字进行排序的规则
		return person1.getName().compareTo(person2.getName());
	}

}
