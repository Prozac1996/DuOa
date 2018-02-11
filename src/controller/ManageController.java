package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import interceptor.UserInterceptor;
@Before(UserInterceptor.class)
public class ManageController extends Controller{

    public void bussiness(){
        renderJsp("bussiness.jsp");
    }

    public void console(){
        renderJsp("console.jsp");
    }

    public void detailApprove(){ renderJsp("detail_approve.jsp"); }

    public void detailEdit(){ renderJsp("detail_edit.jsp"); }

}
