package com.GestionProject.servlet;

import com.GestionProject.dao.projetDao;
import com.GestionProject.model.Projet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayProjetServlet")
public class displayProjetServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // diclaration List
        List<Projet> Projett = projetDao.displayProject();
        req.setAttribute("projets",Projett);
        req.getRequestDispatcher("/gestionProjet.jsp").forward(req,resp);
    }


}
