package controller;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import model.User;

import java.util.List;

public class UserController extends Controller{

    public void register(){
        String username = getPara("username");
        String password = getPara("password");

        List<Record> records = Db.find("select * from user where username='"+username+"'");
        if(records.size() != 0){
            renderText("user Already register;");
            return;
        }

        Record record = new Record();
        record.set("username",username);
        record.set("password",password);
        record.set("power",0);
        Db.save("user",record);

        renderText("注册成功!");
    }

    public void login(){
        String username = getPara("username");
        String password = getPara("password");

        List<User> users = User.dao.find("select * from user where username='"+username+"'");
        if(users.size() == 0){
            renderText("登录失败，用户名或密码错误！");
            return;
        }
        User user = users.get(0);
        String user_password = user.get("password");
        if(user_password.equals(password)){
            renderText("登录成功!");
        }else {
            renderText("登录失败，用户名或密码错误！");
        }

    }
}
