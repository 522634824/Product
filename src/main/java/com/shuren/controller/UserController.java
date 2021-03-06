package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.shuren.mapper.UserMapper;

import com.shuren.pojo.User;
import com.shuren.service.UserService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
public class UserController {

	@Resource
	private UserService userService;

	@RequestMapping(value = "login")
	public String Login(String username, String password, HttpServletRequest request) {
		User user = new User();
		user = userService.selectByUsername(username);
		if ("".equals(user) || user == null) {
			request.setAttribute("errorMsg", "�˺Ų����ڣ�");
			return "jsp/login";
		} else {
			String pwd = user.getPassword();
			if (password.equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", user);
				return "redirect:/jsp/main.jsp";
			}
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "�˺Ż��������");
			return "jsp/login";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();

		return "redirect:jsp/login.jsp";
	}
	
	@RequestMapping("/saveUser")
	public String saveUser(User user, HttpServletResponse response) throws Exception {
		  int resultTotal = 0;
	        if (user.getUserid() == null) {
	            resultTotal = userService.insertUser(user);
	        } else {
	            resultTotal = userService.updateUserById(user);
	        }
	        JSONObject result = new JSONObject();
	        if (resultTotal > 0) {
	            result.put("success", true);
	        } else {
	            result.put("success", false);
	        }   
	        ResponseUtil.write(response, result);
	        return null;
	}
	
	

	@RequestMapping(value = "userlist")
	@ResponseBody
	public String UserList(String username,HttpServletRequest request,HttpServletResponse response) {
		if("".equals(username)||username==null) {
		List<User> user=userService.selectAllUser();
		JSONObject result=new JSONObject();
		result.put("rows", user);
		result.put("total", user.size());
		return result.toString();
		}else {
			System.out.println(username);
			List<User> user=userService.selectLikeUsername(username);
			JSONObject result=new JSONObject();
			result.put("rows", user);
			result.put("total", user.size());
			System.out.println("ִ���ˡ���������������������������");
			return result.toString();
		}
	}
	
	@RequestMapping("/deleteUser")
    public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            userService.deleteUserById(Integer.parseInt(idsStr[i]));
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

	@RequestMapping(value = "searchUser")
	@ResponseBody
	public String searchUser(String username, HttpServletRequest request,HttpServletResponse response) {
		System.out.println(username);
		List<User> user=userService.selectLikeUsername(username);
		JSONObject result=new JSONObject();
		result.put("rows", user);
		result.put("total", user.size());
		System.out.println("ִ���ˡ���������������������������");
		return result.toString();
		
	}
	
}
