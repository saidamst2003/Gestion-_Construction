package com.GestionProject.servlet;

import com.GestionProject.dao.projetDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/SupprimerProject")
public class SupprimerProjetServler extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int idProjet =Integer.parseInt(req.getParameter("idProjet"));
        projetDao.SupprimerProjet(idProjet);
        resp.sendRedirect("DisplayProjetServlet");

    }
}
