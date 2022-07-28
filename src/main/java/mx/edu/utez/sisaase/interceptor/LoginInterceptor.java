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
        if((action.contains("iniciarSesion") || action.contains("recuperarContrasexa") || action.contains("cambiarContrasexa") || action.contains("contrasexaRecuperada")) && (actionInvocation.getInvocationContext().getSession().containsKey("usuario"))){
//            return "index";
            return actionInvocation.invoke();
        }else if (actionInvocation.getInvocationContext().getSession().containsKey("usuario")
                || action.contains("iniciarSesion") || action.contains("recuperarContrasexa")
                || action.contains("cambiarContrasexa") || action.contains("contrasexaRecuperada"))
        {
            return actionInvocation.invoke();
        }else {
            return "loginRequired";
        }

    }
}


//package mx.edu.utez.sisaase.interceptor;
//
//        import com.opensymphony.xwork2.ActionContext;
//        import com.opensymphony.xwork2.ActionInvocation;
//        import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
//        import mx.edu.utez.sisaase.permanencia.dao.DaoUsuario;
//        import org.apache.struts2.ServletActionContext;
//
//        import javax.servlet.http.HttpSession;
//        import java.util.ArrayList;
//        import java.util.List;
//
//public class LoginInterceptor extends AbstractInterceptor {
//
//    @Override
//    public String intercept(ActionInvocation actionInvocation) throws Exception {
//        String action = (String) ActionContext.getContext().get(ActionContext.ACTION_NAME);
//        HttpSession session = ServletActionContext.getRequest().getSession();
//        String rolActual = (String) session.getAttribute("rolView");
//        if((action.contains("iniciarSesion") || action.contains("recuperarContrasexa") || action.contains("cambiarContrasexa") || action.contains("contrasexaRecuperada")) && (actionInvocation.getInvocationContext().getSession().containsKey("usuario"))){
//            return "index";
//        }else if (actionInvocation.getInvocationContext().getSession().containsKey("usuario")
//                || action.contains("iniciarSesion") || action.contains("recuperarContrasexa")
//                || action.contains("cambiarContrasexa") || action.contains("contrasexaRecuperada"))
//        {
//            if(rolActual.equals("alumno")){
//                if( action.contains("perfilAlumno") || action.contains("alumno")){
//                    return actionInvocation.invoke();
//                }else{
//                    return "notAuthorized";
//                }
//            }else if(rolActual.equals("docente")){
//                if( action.contains("perfilDocente") || action.contains("docente")){
//                    return actionInvocation.invoke();
//                }else{
//                    return "notAuthorized";
//                }
//            }else if(rolActual.equals("coordinador")){
//                if( action.contains("perfilCoordinador") || action.contains("coordinador")){
//                    return actionInvocation.invoke();
//                }else{
//                    return "notAuthorized";
//                }
//            }
//        }else {
//            return "loginRequired";
//        }
//        return "notFound";
//    }
//}
