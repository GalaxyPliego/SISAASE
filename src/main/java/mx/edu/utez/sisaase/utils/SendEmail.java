package mx.edu.utez.sisaase.utils;

import mx.edu.utez.sisaase.permanencia.bean.BeanUsuario;
import org.apache.struts2.components.Bean;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
    private static String myEmail = "sisaase87@gmail.com";
    private static String password = "lgujnqhsmlkaduqe";

    public boolean recoveryPassword(BeanUsuario usuario) {
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.user", myEmail);
        props.setProperty("mail.smtp.auth","true");
        props.put("mail.smtp.ssl.truts","smtp.gmail.com");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator(){
                    protected PasswordAuthentication getPasswordAuthentication(){
                        return new PasswordAuthentication(myEmail,password);
                    }
                });
        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(myEmail));
            msg.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(usuario.getUsuario()));
            msg.setSubject("Your Example.com account has been activated");
            msg.setText("This is a test");
            Transport.send(msg);
            return true;
        } catch (AddressException e) {
            System.out.println(e);
            return false;
        } catch (MessagingException e) {
            System.out.println(e);
            return false;
        }

    }
}
