/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import model.Email;

/**
 *
 * @author PC
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        request.setAttribute("email", email);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String lastname = request.getParameter("lastname");
        String firstname = request.getParameter("firstname");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String role_raw = request.getParameter("role");
        String shopname = request.getParameter("shopname");
        UserDAO d = new UserDAO();
        String password = "";
        
        HttpSession session = request.getSession();
        try {
            int role;
            role = Integer.parseInt(role_raw);
            User c = d.checkUserName(username);
//            String error="";
            
            if (role==2 && shopname.trim().isEmpty()) //check shopname is empty
            {
                request.setAttribute("username", username);
                request.setAttribute("lastname", lastname);
                request.setAttribute("firstname", firstname);
                request.setAttribute("pass1", pass1);
                //pass2
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("gender", gender);
                request.setAttribute("dob", dob);
                request.setAttribute("role", role);


                request.setAttribute("error", " Shop name can be empty");
                request.getRequestDispatcher("register.jsp").forward(request, response);
 //               error += username + " exitsed";
            }
            
            if (c != null) //check username fail
            {
                //username
                request.setAttribute("lastname", lastname);
                request.setAttribute("firstname", firstname);
                request.setAttribute("pass1", pass1);
                //pass2
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("gender", gender);
                request.setAttribute("dob", dob);
                request.setAttribute("role", role);
                request.setAttribute("shopname", shopname);

                request.setAttribute("error","The user "+ username + " exitsed");
                request.getRequestDispatcher("register.jsp").forward(request, response);
 //               error += username + " exitsed";
            }
            
            if(username.trim().isEmpty() || firstname.trim().isEmpty() || lastname.trim().isEmpty())
            {
                request.setAttribute("pass1", pass1);
                //pass2
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("gender", gender);
                request.setAttribute("dob", dob);
                request.setAttribute("role", role);
                request.setAttribute("shopname", shopname);

                request.setAttribute("error", "Name invalid");
                request.getRequestDispatcher("register.jsp").forward(request, response);
 //               error += "name invalid";
            }
            
            if(!isDateValid(dob))
            {
                request.setAttribute("username", username);
                request.setAttribute("lastname", lastname);
                request.setAttribute("firstname", firstname);
                request.setAttribute("pass1", pass1);
                //pass2
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("gender", gender);
                //dob
                request.setAttribute("role", role);
                request.setAttribute("shopname", shopname);

                request.setAttribute("error", "Not a human birth or not lower than 5 year old");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            
            //first: check phone 
            if (!checkPhone(phone)) {
                request.setAttribute("username", username);
                request.setAttribute("lastname", lastname);
                request.setAttribute("firstname", firstname);
                request.setAttribute("pass1", pass1);
                //pass2
                request.setAttribute("email", email);
                //phone
                request.setAttribute("address", address);
                request.setAttribute("gender", gender);
                request.setAttribute("dob", dob);
                request.setAttribute("role", role);
                request.setAttribute("shopname", shopname);

                request.setAttribute("error", "Not a legit phone number");
                request.getRequestDispatcher("register.jsp").forward(request, response);
  //              error += "Not a legit phone number";
            }

            // second: check pass
            if (!checkdPassword(pass1)) {
                request.setAttribute("username", username);
                request.setAttribute("lastname", lastname);
                request.setAttribute("firstname", firstname);
                //pass1
                //pass2
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("gender", gender);
                request.setAttribute("dob", dob);
                request.setAttribute("role", role);
                request.setAttribute("shopname", shopname);

                request.setAttribute("error", "The password length must longer than 8 and at least 1 UpperCase, 1 digit number");
                request.getRequestDispatcher("register.jsp").forward(request, response);
 //               error+="The password needs to include:the length of the password must at least 1 UpperCase, 1 digit number, 1 specialCharater";
            }

            //third: check pass confirm
            if (!pass1.equals(pass2)) {
                request.setAttribute("username", username);
                request.setAttribute("lastname", lastname);
                request.setAttribute("firstname", firstname);
                request.setAttribute("pass1", pass1);
                //pass2
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("gender", gender);
                request.setAttribute("dob", dob);
                request.setAttribute("role", role);
                request.setAttribute("shopname", shopname);

                request.setAttribute("error", "The password do not match ");
                request.getRequestDispatcher("register.jsp").forward(request, response);
 //               error += "the password do not match ";
            }

            if (!username.trim().isEmpty() && c == null && checkPhone(phone) && checkdPassword(pass1) && pass1.equals(pass2) && !username.trim().isEmpty() && !firstname.trim().isEmpty() && !lastname.trim().isEmpty() && isDateValid(dob)) {
                password = pass1;
                String describe = "no bio yet.";
                String avatar = "https://p16-va-default.akamaized.net/img/musically-maliva-obj/1644144695787526~c5_720x720.jpeg";
                User cNew = new User(username, password, firstname, lastname, gender, email, address, describe, dob, phone, role, avatar);
//                d.insert(cNew);
                request.setAttribute("warning", "sending OTP to your gmail");
                Email e = new Email();
                String otpCode = generateOTP();
                String content1 = "<!DOCTYPE html>\n"
                        + "<html>\n"
                        + "<head>\n"
                        + "    <title>OTP Confirmation</title>\n"
                        + "</head>\n"
                        + "<body>\n"
                        + "    <h2>OTP Confirmation</h2>\n"
                        + "    <p>Please enter the OTP sent to user: ";
                String content2 = ".</p>\n"
                        + "\n"
                        + "        <label for=\"otp\">The OTP Code: ";
                String content3 = "</label>\n"
                        + "        <br><br>\n"
                        + "</body>\n"
                        + "</html>";
                e.sendEmail(cNew.getEmail(), content1 + cNew.getUsername() + content2 + otpCode + content3, "OTP for life");
                request.setAttribute("warning", "sended");
                if(cNew.getRole()==2)
                {
                    request.setAttribute("shopname", shopname);
                }
                request.setAttribute("cNew", cNew);
                request.setAttribute("otpcode", otpCode);
                request.getRequestDispatcher("otp.jsp").forward(request, response);
//               response.sendRedirect("sv");
            }   
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static String generateOTP() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int length = 5; // Độ dài của CAPTCHA

        StringBuilder otp = new StringBuilder();
        SecureRandom random = new SecureRandom();

        for (int i = 0; i < length; i++) {
            // Sinh một số ngẫu nhiên để lấy ký tự từ chuỗi characters
            int randomIndex = random.nextInt(characters.length());
            // Lấy ký tự tại vị trí ngẫu nhiên và thêm vào chuỗi CAPTCHA
            otp.append(characters.charAt(randomIndex));
        }

        return otp.toString();
    }
    
    

   
    public boolean isDateValid(String date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        try {
            LocalDate inputDate = LocalDate.parse(date, formatter);
            LocalDate maxDate = LocalDate.now().minusYears(5); // Lấy ngày hiện tại
            LocalDate minDate = LocalDate.now().minusYears(150); // Lấy ngày hiện tại
            return !inputDate.isBefore(minDate) && !inputDate.isAfter(maxDate);
        } catch (DateTimeParseException e) {
            return false; // Trả về false nếu có lỗi phân tích chuỗi ngày
        }
    }
    
    public static boolean checkdPassword(String password) {
        // Kiểm tra ít nhất một kí tự hoa
        Pattern uppercasePattern = Pattern.compile("[A-Z]");
        Matcher uppercaseMatcher = uppercasePattern.matcher(password);
        boolean hasUppercase = uppercaseMatcher.find();

        // Kiểm tra ít nhất một chữ số
        Pattern digitPattern = Pattern.compile("\\d");
        Matcher digitMatcher = digitPattern.matcher(password);
        boolean hasDigit = digitMatcher.find();

        // Kiểm tra dài ít nhất 10 kí tự
        boolean isLengthValid = password.length() >= 8;

        // Kiểm tra có ít nhất một kí tự đặc biệt
//        Pattern specialCharPattern = Pattern.compile("[!@#$%^&*()_+//-={};':\"\\\\|,.<>/?]");
//        Matcher specialCharMatcher = specialCharPattern.matcher(password);
//        boolean hasSpecialChar = specialCharMatcher.find();

        // Trả về true nếu tất cả các yêu cầu đều được đáp ứng
        return hasUppercase && hasDigit && isLengthValid;
    }

    public static boolean checkPhone(String phone) {
        String regex = "^(0|84)\\d{9,11}$";
        Pattern p = Pattern.compile(regex);
        Matcher matcher = p.matcher(phone);
        return matcher.matches();
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
