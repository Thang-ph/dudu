package controller;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import model.GooglePojo;
import model.GoogleUtils;
import dal.UserDAO;
import jakarta.servlet.http.HttpSession;
import model.User;
@WebServlet("/login-google")
public class LoginGoogleServlet extends HttpServlet {
   
  private static final long serialVersionUID = 1L;
  public LoginGoogleServlet() {
    super();
  }
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String code = request.getParameter("code");
    if (code == null || code.isEmpty()) {
      RequestDispatcher dis = request.getRequestDispatcher("logintest.jsp");
      dis.forward(request, response);
    } else {
      String accessToken = GoogleUtils.getToken(code);
      GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
      UserDAO ud=new UserDAO();
//      PrintWriter out=response.getWriter();
//      out.print(googlePojo.getFamily_name()+googlePojo.getGiven_name()+googlePojo.getName()+googlePojo.getLink()+googlePojo.getPicture());
      if(ud.checkUserName(googlePojo.getEmail())==null){
          User u=new User(googlePojo.getEmail(), googlePojo.getId(), googlePojo.getFamily_name(), googlePojo.getEmail(), 1, googlePojo.getPicture());
          ud.insert(u );
          User a=ud.check(googlePojo.getEmail(), googlePojo.getId());
           HttpSession session=request.getSession();
           session.setAttribute("account", a);
            response.sendRedirect("home");
      }else{
           User a=ud.check(googlePojo.getEmail(), googlePojo.getId());
           HttpSession session=request.getSession();
           session.setAttribute("account", a);
            response.sendRedirect("home");
      }
    }
  }
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
  
}
