package util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.plugin.activerecord.Page;
import model.Report;
import model.User;

import java.util.List;

public class DataUtil {

    public static JSONArray reportsToJsonArray(List<Report> reports){
        JSONArray jsonArray = new JSONArray();
        for(Report report : reports){
            int user_id = report.get("user_id");
            User user = User.dao.findById(user_id);
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id",report.get("id"));
            jsonObject.put("title",report.get("title"));
            jsonObject.put("content",report.get("content"));
            jsonObject.put("user_id",report.get("user_id"));
            jsonObject.put("username",user.get("username"));
            jsonObject.put("dateTime",report.get("dateTime"));
            int state = report.get("state");
            String stateCn = "未处理";
            switch (state){
                case Report.STATE_WAIT:
                    stateCn = "等待审批";
                    break;
                case Report.STATE_PASS:
                    stateCn = "审批通过";
                    break;
                case Report.STATE_REFUSE:
                    stateCn = "审批被拒绝";
                    break;
            }
            jsonObject.put("state",stateCn);

            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }
}
