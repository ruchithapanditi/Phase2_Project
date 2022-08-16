package com.service;

import java.util.List;

import com.bean.Student;
import com.dao.StudentDao;
public class StudentService {
	StudentDao sd=new StudentDao();
	public String StoreSubjectDetails(Student student) {
		if(sd.storeStudent(student)>0) {
			return "Student Details Strored Successfully!!";
		}
		else {
			return "Student Details Didn't stored";
		}
	}
	
	public List<Student> findAllStudentDetails() {
		return sd.findAllStudent();
	}

}


