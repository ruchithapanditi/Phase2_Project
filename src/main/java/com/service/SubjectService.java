package com.service;

import java.util.List;

import com.bean.Subject;
import com.dao.SubjectDao;
public class SubjectService {
	SubjectDao subd=new SubjectDao();
	public String StoreSubjectDetails(Subject subject) {
		if(subd.storeSubject(subject)>0) {
			return "Subject Details Strored Successfully!!";
		}
		else {
			return "Subject Details Didn't stored";
		}
	}
	
	public List<Subject> findAllSubjectDetails() {
		return subd.findAllSubject();
	}

}

