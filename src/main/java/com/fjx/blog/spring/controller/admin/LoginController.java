package com.fjx.blog.spring.controller.admin;

import com.fjx.blog.spring.entity.User;
import com.fjx.blog.spring.service.UserService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author fujiaxing
 * 登陆登出功能
 */
@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping({"/login"})
    public String login(){
        return "/admin/login";
    }

    @RequestMapping(value = "/loginVerify",method = RequestMethod.POST)
    @ResponseBody
    public String loginVerify(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap();
        String userkey = request.getParameter("ukey");
        String password = request.getParameter("password");
        String rememberme = request.getParameter("rememberme");
        User user = userService.getUserByKey(userkey);
        if (user == null) {
            map.put("code", 0);
            map.put("msg", "用户名无效！");
        } else if (!user.getPassword().equals(password)) {
            map.put("code", 0);
            map.put("msg", "密码错误！");
        } else {
            System.out.println("登陆成功");
            //登录成功
            map.put("code", 1);
            map.put("msg", "");
            //添加session
            request.getSession().setAttribute("user", user);
            if (rememberme != null) {
                //创建两个Cookie对象
                Cookie keyCookie = new Cookie("ukey", userkey);
                //设置Cookie的有效期为3天
                keyCookie.setMaxAge(60 * 60 * 24 * 3);
                Cookie pwdCookie = new Cookie("password", password);
                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
                response.addCookie(keyCookie);
                response.addCookie(pwdCookie);
            }
          //  user.setUserLastLoginTime(new Date());
            user.setUserLastLoginIp(getIpAddr(request));
            userService.save(user);
        }

        String result = new JSONObject(map).toString();
        return result;

    }

    private static String getIpAddr(HttpServletRequest request) {
        String ipAddress = request.getHeader("x-forwarded-for");
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
        }
        //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if (ipAddress != null && ipAddress.length() > 15) {
            if (ipAddress.indexOf(",") > 0) {
                ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

    @RequestMapping(value = "/logOut",method = RequestMethod.GET)
    @ResponseBody
    public String loginOut(HttpServletRequest request, HttpServletResponse response){
        request.getSession().removeAttribute("user");
        Map<String, Object> map = new HashMap();
        map.put("code", 1);
        map.put("msg", "");

        String result = new JSONObject(map).toString();
        return result;
    }
}
