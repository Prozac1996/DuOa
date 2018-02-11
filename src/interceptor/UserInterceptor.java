package interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import model.User;

import javax.servlet.http.HttpSession;

public class UserInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        HttpSession session = inv.getController().getSession();
        if(session == null){
            inv.getController().redirect("/");
        }else{
            User user = (User) session.getAttribute("user");
            if(user != null){
                inv.invoke();
            }else{
                inv.getController().redirect("/");
            }
        }
    }
}
