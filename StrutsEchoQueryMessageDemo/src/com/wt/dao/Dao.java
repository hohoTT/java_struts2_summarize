package com.wt.dao;

import java.util.ArrayList;
import java.util.List;

import com.wt.entity.Department;
import com.wt.entity.Role;

public class Dao {

	// ��ȡ���ŵļ���
	public List<Department> getDepartments(){
		
		// ģ�����ݿ�Ĳ���
		List<Department> departments = new ArrayList<Department>();
		
		departments.add(new Department(1001, "AAA"));
		departments.add(new Department(1002, "BBB"));
		departments.add(new Department(1003, "CCC"));
		departments.add(new Department(1004, "DDD"));
		departments.add(new Department(1004, "EEE"));
		departments.add(new Department(1005, "FFF"));
		
		return departments;
	}
	
	// ��ȡ��ɫ�ļ���
	public List<Role> getRoles(){
		
		// ģ�����ݿ�Ĳ���
		List<Role> roles = new ArrayList<Role>();
		
		roles.add(new Role(2001, "XXX"));
		roles.add(new Role(2002, "YYY"));
		roles.add(new Role(2003, "ZZZ"));
		
		return roles;
	}
	
}