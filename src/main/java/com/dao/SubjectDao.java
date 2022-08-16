package com.dao;

import org.hibernate.cfg.Configuration;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.bean.Subject;

public class SubjectDao {
public int storeSubject(Subject subject) {
    try {
    	Configuration con=new Configuration();
    	con.configure("hibernate.cfg.xml");
    	SessionFactory sf=con.buildSessionFactory();
    	Session session=sf.openSession();
    	Transaction tran = session.getTransaction();
		tran.begin();
				session.save(subject);
		tran.commit();
		return 1;
    	
    }
    catch(Exception e) {
    	System.out.println(e);
    	return 0;
    }
}

public List<Subject> findAllSubject() {
	Configuration con = new Configuration();
	con.configure("hibernate.cfg.xml");
	SessionFactory sf = con.buildSessionFactory();
	Session session = sf.openSession();
	TypedQuery qry = session.createQuery("select sub from Subject sub");
	List<Subject> listOfSubject = qry.getResultList();
	return listOfSubject;
}
}

