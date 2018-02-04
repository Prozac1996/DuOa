package interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

import javax.servlet.http.HttpSession;

public class UserInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv) {
        HttpSession session = inv.getController().getSession();
    }
}
