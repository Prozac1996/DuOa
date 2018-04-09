package controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import model.Report;
import model.User;
import util.DataUtil;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public class DataController extends Controller {


    public void reportAdd(){

        JSONObject json = new JSONObject();

        User user = (User) getSession().getAttribute("user");
        int user_id = user.get("id");
        String title = getPara("title");
        String content = getPara("content");
        java.util.Date nowDate = new java.util.Date();
        Timestamp sqlDate = new Timestamp(nowDate.getTime());

        int state = 0;

        Report report = new Report();
        report.set("user_id",user_id);
        report.set("title",title);
        report.set("content",content);
        report.set("state",state);
        report.set("dateTime",sqlDate);

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

    public void reportPageData(){
        //获取DT传送的数据
        int draw = getParaToInt("draw");
        int start = getParaToInt("start");
        int length = getParaToInt("length");
        int pageNumber = start/length + 1;
        String[] searchString = getParaValues("search");
        System.out.println(searchString);
        //返回给DT数据
        List<Report> list = Report.dao.find("select * from report");
        int sum = list.size();

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("draw",draw);
        jsonObject.put("recordsTotal",sum);
        jsonObject.put("recordsFiltered",sum);
        JSONArray json;
        Page<Report> reports = Report.dao.paginate(pageNumber,length,"select *","from report ORDER BY id desc");
        json = DataUtil.reportsToJsonArray(reports.getList());
        jsonObject.put("data",json);
        renderJson(jsonObject);
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
