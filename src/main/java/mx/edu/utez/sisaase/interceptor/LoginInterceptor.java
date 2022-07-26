package mx.edu.utez.sisaase.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import mx.edu.utez.sisaase.permanencia.dao.DaoUsuario;

import java.util.ArrayList;
import java.util.List;

public class LoginInterceptor extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        String action = (String) ActionContext.getContext().get(ActionContext.ACTION_NAME);
        System.out.println(action);
        if (actionInvocation.getInvocationContext().getSession().containsKey("Usuario") || action.contains("iniciarSesion"))
        {
            return actionInvocation.invoke();
        }else {
            return "loginRequired";
        }

    }
}
