package interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

import javax.servlet.http.HttpSession;

public class UserInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        HttpSession session = inv.getController().getSession();
        if(session == null){
            inv.getController().redirect("/");
        }else{
            String username = (String) session.getAttribute("username");
            if(username != null){
                System.out.println(username+"已登录！");
                inv.invoke();
            }else{
                inv.getController().redirect("/");
            }
        }
    }
}
