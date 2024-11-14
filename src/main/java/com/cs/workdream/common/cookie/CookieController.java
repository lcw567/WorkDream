package com.cs.workdream.common.cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CookieController {

	@RequestMapping("create")
	public String create(HttpServletResponse response) {
		Cookie ck = new Cookie("test", "테스트");
		response.addCookie(ck);
		return "cookie/create";
	}
	
	@RequestMapping("delete")
	public String delete(HttpServletResponse response) {
		Cookie ck = new Cookie("test", "테스트");
		ck.setMaxAge(0);
		response.addCookie(ck);
		return "cookie/delete";
	}
}
