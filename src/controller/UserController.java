package controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import model.User;

import java.util.List;

public class UserController extends Controller{

    public void register(){

        boolean flag = false;
        String msg = "";

        JSONObject json = new JSONObject();

        String username = getPara("username");
        String password = getPara("password");

        User user = User.dao.findFirst("select * from user where username=?",username);

        if(user != null){
            msg = "此用户已经存在！";
            flag = false;
        }else{
            user = new User();
            user.set("username",username);
            user.set("password",password);
            user.set("power",0);
            user.save();
            msg = "用户注册成功！";
            flag = true;
        }
        json.put("msg",msg);
        json.put("flag",flag);
        renderJson(json);
    }


    public void login(){

        boolean flag = false;
        String msg = "";
        String index = "";

        JSONObject json = new JSONObject();

        String username = getPara("username");
        String password = getPara("password");

        User user = User.dao.findFirst("select * from user where username=?",username);

        if(user != null){
            if(user.getStr("password").equals(password)){
                msg = "登录成功！";
                flag = true;
                getSession().setAttribute("user",user);
                json.put("index",user.get("power"));
            }else{
                flag = false;
                msg = "用户名或密码错误！";
            }
        }else{
            flag = false;
            msg = "用户名或密码错误！";
        }
        json.put("msg",msg);
        json.put("flag",flag);

        renderJson(json);

    }

    public void logout(){
        JSONObject json = new JSONObject();
        String msg = "用户注销成功！";
        boolean flag = true;
        getSession().removeAttribute("user");

        json.put("msg",msg);
        json.put("flag",flag);

        renderJson(json);


    }
}
