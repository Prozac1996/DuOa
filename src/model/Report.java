package model;

import com.jfinal.plugin.activerecord.Model;

public class Report extends Model<Report> {
    public static final int STATE_WAIT = 0;
    public static final int STATE_PASS = 1;
    public static final int STATE_REFUSE = 2;

    public static final Report dao = new Report();

    public String getStateCn(){
        switch (getInt("state")){
            case STATE_WAIT:
                return "等待审批";
            case STATE_PASS:
                return "审批通过";
            case STATE_REFUSE:
                return "审批拒绝";
        }
        return "未处理";
    }
}
