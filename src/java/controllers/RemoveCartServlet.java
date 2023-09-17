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
public class RemoveCartServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            List<cars_cart> list = (List<cars_cart>) session.getAttribute("cart");
            if (!request.getParameter("myBtn").equalsIgnoreCase("Remove All")){
            String id = request.getParameter("id").trim();
            int total_cars = Integer.parseInt((String) session.getAttribute("total_cars"));
            float total_money = Float.parseFloat((String) session.getAttribute("total_money"));
            
            for (cars_cart cart_list : list) {
                if (id.equalsIgnoreCase(cart_list.getId())) {
                    if (cart_list.getQuantity() == 1) {
                        session.setAttribute("total_money", String.valueOf(total_money - cart_list.getPrice()));
                        session.setAttribute("total_cars", String.valueOf(total_cars - 1));
                        list.remove(cart_list);
                    } else {
                        session.setAttribute("total_money", String.valueOf(total_money - cart_list.getPrice()));
                        session.setAttribute("total_cars", String.valueOf(total_cars - 1));
                        cart_list.setQuantity(cart_list.getQuantity() - 1);
                    }
                    break;
                }
            }        
            } else {
                list.removeAll(list);
                session.setAttribute("total_money", String.valueOf(0));
                session.setAttribute("total_cars", String.valueOf(0));
            }
            session.setAttribute("cart", list);
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
        } catch (Exception e) {
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
