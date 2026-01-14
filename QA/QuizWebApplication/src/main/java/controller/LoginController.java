package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Reg;



@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
    
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }


  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

 
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
    
PrintWriter out = response.getWriter();
    
    try
    {
      String email = request.getParameter("email");
      String pass = request.getParameter("pwd");
      
      Reg r = new Reg();
      boolean chk= r.checkUser(email, pass);
      if(chk)
      {
        HttpSession session = request.getSession();
        session.setAttribute("uname", r.getName());
        session.setAttribute("email", email);
        response.sendRedirect("Welcome.jsp");
      }
      else {
      out.println("invalid id or password");
    }
    }
    
    catch(Exception ex)
    {
      out.println(ex);
    }
    
  }

}