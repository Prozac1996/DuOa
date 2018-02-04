package controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.Controller;
import model.Report;

import java.util.List;

public class DataController extends Controller {

    public void report(){
        JSONArray json = new JSONArray();

        List<Report> reports = Report.dao.find("select * from report");

        for(Report report : reports){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id",report.get("id"));
            jsonObject.put("title",report.get("title"));
            jsonObject.put("content",report.get("content"));
            jsonObject.put("state",report.get("state"));
            json.add(jsonObject);
        }

        renderJson(json);
    }
}
