package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import interceptor.UserInterceptor;

public class ManageController extends Controller{

    @Before(UserInterceptor.class)
    public void bussiness(){
        renderJsp("bussiness.jsp");
    }


}
