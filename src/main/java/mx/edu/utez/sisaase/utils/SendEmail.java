package mx.edu.utez.sisaase.utils;

import mx.edu.utez.sisaase.permanencia.bean.BeanUsuario;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.Bean;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

public class SendEmail {
    private static String myEmail = "sisaase87@gmail.com";
    private static String password = "lgujnqhsmlkaduqe";
    Connection connection;
    PreparedStatement pstm;
    ResultSet rs;

    public boolean recoveryPassword(BeanUsuario usuario) throws SQLException {
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.user", myEmail);
        props.setProperty("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.truts", "smtp.gmail.com");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(myEmail, password);
                    }
                });
        try {
            Random randomNumber = new Random();
            String recoveryCode = String.format("%04d", randomNumber.nextInt(10000));
            String url = String.valueOf(ServletActionContext.getRequest().getRequestURL());
            String ip = url.replaceAll(ServletActionContext.getRequest().getServletPath(), "/cambiarContrasexa?codigoSeguridad=" + recoveryCode);

            connection = ConnectionMysql.getConnection();
            String query = "UPDATE usuario SET codigoSeguridad=? where ClaveIdentidad=?";
            pstm = connection.prepareStatement(query);
            pstm.setString(1,recoveryCode);
            pstm.setString(2,usuario.getClaveIdentidad());
            if (pstm.executeUpdate() == 1) {
                Message msg = new MimeMessage(session);
                msg.setFrom(new InternetAddress(myEmail));
                msg.addRecipient(Message.RecipientType.TO,
                        new InternetAddress(usuario.getUsuario()));
                msg.setSubject("Recuperación de contraseña - UTEZ");
                msg.setContent("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n" +
                        "\n" +
                        "<head>\n" +
                        "    <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">\n" +
                        "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0;\">\n" +
                        "    <meta name=\"format-detection\" content=\"telephone=no\" />\n" +
                        "\n" +
                        "    <!-- Responsive Mobile-First Email Template by Konstantin Savchenko, 2015.\n" +
                        "\thttps://github.com/konsav/email-templates/  -->\n" +
                        "\n" +
                        "    <style>\n" +
                        "        /* Reset styles */\n" +
                        "        \n" +
                        "        body {\n" +
                        "            margin: 0;\n" +
                        "            padding: 0;\n" +
                        "            min-width: 100%;\n" +
                        "            width: 100% !important;\n" +
                        "            height: 100% !important;\n" +
                        "        }\n" +
                        "        \n" +
                        "        body,\n" +
                        "        table,\n" +
                        "        td,\n" +
                        "        div,\n" +
                        "        p,\n" +
                        "        a {\n" +
                        "            -webkit-font-smoothing: antialiased;\n" +
                        "            text-size-adjust: 100%;\n" +
                        "            -ms-text-size-adjust: 100%;\n" +
                        "            -webkit-text-size-adjust: 100%;\n" +
                        "            line-height: 100%;\n" +
                        "        }\n" +
                        "        \n" +
                        "        table,\n" +
                        "        td {\n" +
                        "            mso-table-lspace: 0pt;\n" +
                        "            mso-table-rspace: 0pt;\n" +
                        "            border-collapse: collapse !important;\n" +
                        "            border-spacing: 0;\n" +
                        "        }\n" +
                        "        \n" +
                        "        img {\n" +
                        "            border: 0;\n" +
                        "            line-height: 100%;\n" +
                        "            outline: none;\n" +
                        "            text-decoration: none;\n" +
                        "            -ms-interpolation-mode: bicubic;\n" +
                        "        }\n" +
                        "        \n" +
                        "        #outlook a {\n" +
                        "            padding: 0;\n" +
                        "        }\n" +
                        "        \n" +
                        "        .ReadMsgBody {\n" +
                        "            width: 100%;\n" +
                        "        }\n" +
                        "        \n" +
                        "        .ExternalClass {\n" +
                        "            width: 100%;\n" +
                        "        }\n" +
                        "        \n" +
                        "        .ExternalClass,\n" +
                        "        .ExternalClass p,\n" +
                        "        .ExternalClass span,\n" +
                        "        .ExternalClass font,\n" +
                        "        .ExternalClass td,\n" +
                        "        .ExternalClass div {\n" +
                        "            line-height: 100%;\n" +
                        "        }\n" +
                        "        /* Rounded corners for advanced mail clients only */\n" +
                        "        \n" +
                        "        @media all and (min-width: 560px) {\n" +
                        "            .container {\n" +
                        "                border-radius: 8px;\n" +
                        "                -webkit-border-radius: 8px;\n" +
                        "                -moz-border-radius: 8px;\n" +
                        "                -khtml-border-radius: 8px;\n" +
                        "            }\n" +
                        "        }\n" +
                        "        /* Set color for auto links (addresses, dates, etc.) */\n" +
                        "        \n" +
                        "        a,\n" +
                        "        a:hover {\n" +
                        "            color: #127DB3;\n" +
                        "        }\n" +
                        "        \n" +
                        "        .footer a,\n" +
                        "        .footer a:hover {\n" +
                        "            color: #999999;\n" +
                        "        }\n" +
                        "    </style>\n" +
                        "\n" +
                        "    <!-- MESSAGE SUBJECT -->\n" +
                        "    <title>Get this responsive email template</title>\n" +
                        "\n" +
                        "</head>\n" +
                        "\n" +
                        "<!-- BODY -->\n" +
                        "<!-- Set message background color (twice) and text color (twice) -->\n" +
                        "\n" +
                        "<body topmargin=\"0\" rightmargin=\"0\" bottommargin=\"0\" leftmargin=\"0\" marginwidth=\"0\" marginheight=\"0\" width=\"100%\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%; height: 100%; -webkit-font-smoothing: antialiased; text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; line-height: 100%;\n" +
                        "\tbackground-color: #F0F0F0;\n" +
                        "\tcolor: #000000;\" bgcolor=\"#F0F0F0\" text=\"#000000\">\n" +
                        "\n" +
                        "    <!-- SECTION / BACKGROUND -->\n" +
                        "    <!-- Set message background color one again -->\n" +
                        "    <table width=\"100%\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; width: 100%;\" class=\"background\">\n" +
                        "        <tr>\n" +
                        "            <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0;\" bgcolor=\"#F0F0F0\">\n" +
                        "\n" +
                        "                <!-- WRAPPER -->\n" +
                        "                <!-- Set wrapper width (twice) -->\n" +
                        "                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\n" +
                        "\tmax-width: 560px;\" class=\"wrapper\">\n" +
                        "\n" +
                        "                    <tr>\n" +
                        "                        <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%;\n" +
                        "\t\t\tpadding-top: 20px;\n" +
                        "\t\t\tpadding-bottom: 20px;\">\n" +
                        "\n" +
                        "                            <!-- PREHEADER -->\n" +
                        "                            <!-- Set text color to background color -->\n" +
                        "                            <div style=\"display: none; visibility: hidden; overflow: hidden; opacity: 0; font-size: 1px; line-height: 1px; height: 0; max-height: 0; max-width: 0;\n" +
                        "\t\t\tcolor: #F0F0F0;\" class=\"preheader\">\n" +
                        "                                Available on&nbsp;GitHub and&nbsp;CodePen. Highly compatible. Designer friendly. More than 50%&nbsp;of&nbsp;total email opens occurred on&nbsp;a&nbsp;mobile device&nbsp;— a&nbsp;mobile-friendly design is&nbsp;a&nbsp;must for&nbsp;email campaigns.</div>\n" +
                        "\n" +
                        "                            <!-- LOGO -->\n" +
                        "                            <!-- Image text color should be opposite to background color. Set your url, image src, alt and title. Alt text should fit the image size. Real image size should be x2. URL format: http://domain.com/?utm_source={{Campaign-Source}}&utm_medium=email&utm_content=logo&utm_campaign={{Campaign-Name}} -->\n" +
                        "                            <!--\t<a target=\"_blank\" style=\"text-decoration: none;\"\n" +
                        "\t\t\t\thref=\"https://github.com/konsav/email-templates/\"><img border=\"0\" vspace=\"0\" hspace=\"0\"\n" +
                        "\t\t\t\tsrc=\"http://cloud.kilometroscubicos.com/assets/images/logos/logo.png\"\n" +
                        "\t\t\t\twidth=\"300\" \n" +
                        "\t\t\t\talt=\"Logo\" title=\"Logo\" style=\"\n" +
                        "\t\t\t\tcolor: #000000;\n" +
                        "\t\t\t\tfont-size: 10px; margin: 0; padding: 0; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; border: none; display: block;\" /></a>-->\n" +
                        "\n" +
                        "                        </td>\n" +
                        "                    </tr>\n" +
                        "\n" +
                        "                    <!-- End of WRAPPER -->\n" +
                        "                </table>\n" +
                        "\n" +
                        "                <!-- WRAPPER / CONTEINER -->\n" +
                        "                <!-- Set conteiner background color -->\n" +
                        "                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" bgcolor=\"#FFFFFF\" width=\"560\" style=\"border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit;\n" +
                        "\tmax-width: 560px;\" class=\"container\">\n" +
                        "\n" +
                        "                    <!-- HEADER -->\n" +
                        "                    <!-- Set text color and font family (\"sans-serif\" or \"Georgia, serif\") -->\n" +
                        "                    <tr>\n" +
                        "                        <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 24px; font-weight: bold; line-height: 130%;\n" +
                        "\t\t\tpadding-top: 25px;\n" +
                        "\t\t\tcolor: #000000;\n" +
                        "\t\t\tfont-family: sans-serif;\" class=\"header\">\n" +
                        "                        </td>\n" +
                        "                    </tr>\n" +
                        "\n" +
                        "                    <!-- SUBHEADER -->\n" +
                        "                    <!-- Set text color and font family (\"sans-serif\" or \"Georgia, serif\") -->\n" +
                        "                    <tr>\n" +
                        "                        <td align=\"center\" valign=\"top\" style=\"border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-bottom: 3px; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 18px; font-weight: 300; line-height: 150%;\n" +
                        "\t\t\tpadding-top: 5px;\n" +
                        "\t\t\tcolor: #000000;\n" +
                        "\t\t\tfont-family: sans-serif;\" class=\"subheader\">\n" +
                        "\n" +
                        "                            <img border=\"0\" vspace=\"0\" hspace=\"0\" src=\"https://upload.wikimedia.org/wikipedia/commons/5/54/Logo-utez.png\" width=300 \"\n" +
                        "\t\t\t\talt=\" Logo \" title=\" Logo \" style=\" color: #000000; font-size: 10px; margin: 0; padding: 0; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; border: none; display: block; \" />\n" +
                        "\t\t</td>\n" +
                        "\t</tr>\n" +
                        "                                                                                                                                                     \n" +
                        "                                                                                                                                                     \n" +
                        "                                                                                                                                <tr>\n" +
                        "\t\t<td align=\" center \" valign=\" top \" style=\" border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-bottom: 3px; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 18px; font-weight: 300; line-height: 150%; padding-top:\n" +
                        "                                5px; color: #000000; font-family: sans-serif; \" class=\" subheader \">\n" +
                        "      Hola\n" +
                        "\t\t</td>\n" +
                        "\t</tr>\n" +
                        "\n" +
                        "\t</tr>\n" +
                        "\n" +
                        "\t<tr>\n" +
                        "\t\t<td align=\" center \" valign=\" top \" style=\" border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 17px; font-weight: 400; line-height: 160%; padding-top: 25px; color:\n" +
                        "                                #000000; font-family: sans-serif; \" class=\" paragraph \">\n" +
                        "      Recientemente has solicitado restablecer tu contraseña, para continuar el proceso da clic en el botón de abajo. En caso de que no hayas sido tu quien solicito reestablecer, por favor haz caso omiso a este mensaje\n" +
                        "\t\t</td>\n" +
                        "\t</tr>\n" +
                        "\n" +
                        "\t<!-- BUTTON -->\n" +
                        "\t<!-- Set button background color at TD, link/text color at A and TD, font family (\" sans-serif \" or \" Georgia, serif \") at TD. For verification codes add \" letter-spacing: 5px; \". Link format: http://domain.com/?utm_source={{Campaign-Source}}&utm_medium=email&utm_content={{Button-Name}}&utm_campaign={{Campaign-Name}} -->\n" +
                        "\t<tr align=\"center \">\n" +
                        "\t\t<td align=\" center \" valign=\" top \" style=\" border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; padding-top: 25px; padding-bottom: 5px; \" class=\" button \"><a\n" +
                        "\t\t\thref=\" https://github.com/konsav/email-templates/ \" target=\" _blank \" style=\" text-decoration: underline; \">\n" +
                        "\t\t\t\t<table border=\" 0 \" cellpadding=\" 0 \" cellspacing=\" 0 \" align=\" center \" style=\" max-width: 240px; min-width: 120px; border-collapse: collapse; border-spacing: 0; padding: 0; \"><tr><td align=\" center \" valign=\" middle \" style=\" padding: 12px 24px;\n" +
                        "                                margin: 0; text-decoration: underline; border-collapse: collapse; border-spacing: 0; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; -khtml-border-radius: 4px; \"\n" +
                        "\t\t\t\t\tbgcolor=\" #002957 \"><a target=\" _blank \" style=\" text-decoration: underline; color: #FFFFFF; font-family: sans-serif; font-size: 17px; font-weight: 400; line-height: 120%; \"\n" +
                        "\t\t\t\t\thref=\"" + ip + " \">\n" +
                        "\t\t\t\t\t\tCambiar contraseña\n" +
                        "\t\t\t\t\t</a>\n" +
                        "\t\t\t</td></tr></table></a>\n" +
                        "\t\t</td>\n" +
                        "\t</tr>\n" +
                        "\n" +
                        "\t<!-- LINE -->\n" +
                        "\t<!-- Set line color -->\n" +
                        "\t<tr>\t\n" +
                        "\t\t<td align=\" center \" valign=\" top \" style=\" border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; padding-top: 25px; \" class=\" line \"><hr\n" +
                        "\t\t\tcolor=\" #E0E0E0 \" align=\" center \" width=\" 100% \" size=\" 1 \" noshade style=\" margin: 0; padding: 0; \" />\n" +
                        "\t\t</td>\n" +
                        "\t</tr>\n" +
                        "\n" +
                        "\n" +
                        "\t<!-- LINE -->\n" +
                        "\t<!-- Set line color -->\n" +
                        "\t<tr>\n" +
                        "\t\t<td align=\" center \" valign=\" top \" style=\" border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; padding-top: 25px; \" class=\" line \"><hr\n" +
                        "\t\t\tcolor=\" #E0E0E0 \" align=\" center \" width=\" 100% \" size=\" 1 \" noshade style=\" margin: 0; padding: 0; \" />\n" +
                        "\t\t</td>\n" +
                        "\t</tr>\n" +
                        "\n" +
                        "\t<!-- PARAGRAPH -->\n" +
                        "\t<!-- Set text color and font family (\" sans-serif \" or \" Georgia, serif \"). Duplicate all text styles in links, including line-height -->\n" +
                        "\n" +
                        "<!-- End of WRAPPER -->\n" +
                        "</table>\n" +
                        "\n" +
                        "<!-- WRAPPER -->\n" +
                        "<!-- Set wrapper width (twice) -->\n" +
                        "<table border=\" 0 \" cellpadding=\" 0 \" cellspacing=\" 0 \" align=\"center \"\n" +
                        "\twidth=\" 560 \" style=\" border-collapse: collapse; border-spacing: 0; padding: 0; width: inherit; max-width: 560px; \" class=\" wrapper \">\n" +
                        "\t<!-- FOOTER -->\n" +
                        "\t<!-- Set text color and font family (\" sans-serif \" or \" Georgia, serif \"). Duplicate all text styles in links, including line-height -->\n" +
                        "\t<tr>\n" +
                        "\t\t<td align=\"center \" valign=\"top \" style=\" border-collapse: collapse; border-spacing: 0; margin: 0; padding: 0; padding-left: 6.25%; padding-right: 6.25%; width: 87.5%; font-size: 13px; font-weight: 400; line-height: 150%; padding-top: 20px; padding-bottom:\n" +
                        "                                20px; color: #999999; font-family: sans-serif; \" class=\" footer \">\n" +
                        "\n" +
                        "                                              \t\n" +
                        "No responda a este mensaje. Este correo electrónico ha sido enviado a través de un sistema automatizado que no permite dar respuesta a las preguntas enviadas a esta dirección. \n" +
                        "\t\t</td>\n" +
                        "\t</tr>\n" +
                        "\n" +
                        "<!-- End of WRAPPER -->\n" +
                        "</table>\n" +
                        "\n" +
                        "<!-- End of SECTION / BACKGROUND -->\n" +
                        "</td></tr></table>\n" +
                        "\n" +
                        "</body>\n" +
                        "</html>","text/html;charset=UTF-8");
                Transport.send(msg);
            } else {
                return false;
            }

            return true;
        } catch (AddressException e) {
            System.out.println(e);
            return false;
        } catch (MessagingException e) {
            System.out.println(e);
            return false;
        }finally {
            closeConnection();
        }

    }

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (pstm != null) {
            pstm.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
}
