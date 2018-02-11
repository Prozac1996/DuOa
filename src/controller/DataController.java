package controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.Controller;
import model.Report;
import model.User;
import util.DataUtil;

import java.util.List;

public class DataController extends Controller {


    public void reportAdd(){

        JSONObject json = new JSONObject();

        User user = (User) getSession().getAttribute("user");
        int user_id = user.get("id");
        String title = getPara("title");
        String content = getPara("content");
        int state = 0;

        Report report = new Report();
        report.set("user_id",user_id);
        report.set("title",title);
        report.set("content",content);
        report.set("state",state);

        report.save();

        json.put("msg","提报申请成功！");
        json.put("flag",true);
        renderJson(json);

    }

    public void reportMySelf(){
        JSONArray json;

        User user = (User) getSession().getAttribute("user");
        int user_id = user.get("id");
        List<Report> reports = Report.dao.find("select * from report where user_id=?",user_id);

        json = DataUtil.reportsToJsonArray(reports);

        renderJson(json);
    }

    public void reportAll(){
        JSONArray json;

        List<Report> reports = Report.dao.find("select * from report");

        json = DataUtil.reportsToJsonArray(reports);

        renderJson(json);
    }

    public void updateReport(){

        JSONObject jsonObject = new JSONObject();

        String id = getPara("id");
        String title = getPara("title");
        String content = getPara("content");

        Report report = Report.dao.findById(id);
        report.set("title",title);
        report.set("content",content);

        report.update();

        jsonObject.put("msg","提报修改完成");
        jsonObject.put("flag",true);

        renderJson(jsonObject);
    }

    public void feedbackReport(){

        JSONObject jsonObject = new JSONObject();

        String id = getPara("id");
        String feedback = getPara("feedback");
        String state = getPara("state");

        Report report = Report.dao.findById(id);
        report.set("feedback",feedback);
        report.set("state",state);
        report.update();

        jsonObject.put("msg","提报反馈完成");
        jsonObject.put("flag",true);

        renderJson(jsonObject);
    }

}
