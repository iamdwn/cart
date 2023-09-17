/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.cars;
import entities.cars_cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author truon
 */
public class AddtoCartServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            boolean flag = false;
            HttpSession session = request.getSession();
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            if (quantity > 0) {
                String id = request.getParameter("id").trim();
                String name = request.getParameter("name");
                String description = request.getParameter("desp");
                float price = Float.parseFloat(request.getParameter("price"));
                int speed = Integer.parseInt(request.getParameter("speed"));
                int status = Integer.parseInt(request.getParameter("status"));
                int total_cars = Integer.parseInt((String) session.getAttribute("total_cars"));
                float total_money = Float.parseFloat((String) session.getAttribute("total_money"));
                List<cars_cart> list = (List<cars_cart>) session.getAttribute("cart");
                cars_cart c = new cars_cart(id, name, description, price, speed, status, quantity);
                for (cars_cart cc : list) {
                    if (cc.getId().equalsIgnoreCase(c.getId())) {
                        cc.setQuantity(cc.getQuantity() + c.getQuantity());
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    list.add(c);
                }               
                session.setAttribute("total_cars", String.valueOf(total_cars + c.getQuantity()));
                session.setAttribute("total_money", String.valueOf(total_money + c.getPrice()*c.getQuantity()));
                session.setAttribute("cart", list);
                request.setAttribute("alert", "Added Successful");
            }
            request.getRequestDispatcher("/index.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
