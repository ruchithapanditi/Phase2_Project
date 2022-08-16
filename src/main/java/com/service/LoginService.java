package com.service;
import com.bean.Login;

public class LoginService {
	public String checkLoginDails(Login ll) {
		if(ll.getUsername().equals("admin")&& ll.getPassword().equals("admin123")) {
			return "success";
		}else {
			return "failure";
		}
	}

}
