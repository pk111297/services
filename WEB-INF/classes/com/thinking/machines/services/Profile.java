package com.thinking.machines.services;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import com.thinking.machines.beans.*;
import com.thinking.machines.pojo.*;
import java.net.*;
public class Profile extends HttpServlet
{
public void doGet(HttpServletRequest rq,HttpServletResponse rs)
{
doPost(rq,rs);
}
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{ 
try
{
System.out.println("Profile Service Chali");
HttpSession session=rq.getSession();
User user=(User)session.getAttribute("user");
RequestDispatcher requestDispatcher;
if(user==null)
{
requestDispatcher=rq.getRequestDispatcher("login.jsp");
requestDispatcher.forward(rq,rs);
}
else
{
requestDispatcher=rq.getRequestDispatcher("profile.jsp");
requestDispatcher.forward(rq,rs);
}
}catch(Exception e)
{
System.out.println(e);
}
}
}
