package com.GestionProject.servlet;

import com.GestionProject.dao.projetDao;
import com.GestionProject.model.Projet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idProjett = Integer.parseInt(req.getParameter("idProjet"));
        System.out.println(idProjett);
        String nom = req.getParameter("nomProjet");
        String description = req.getParameter("description");
        Date dateDebuts = Date.valueOf(req.getParameter("dateDebut"));
        Date datefin = Date.valueOf(req.getParameter("dateFin"));

        Double Budget = Double.valueOf(req.getParameter("budget"));

        Projet projet = new Projet(idProjett, nom, description, dateDebuts, datefin, Budget);

// appel fonction DAO pour insérer le projet
        boolean result = projetDao.updateProjet(projet);
        if (result) {
            resp.sendRedirect("DisplayProjetServlet");
        } else {
            req.setAttribute("errorMessage", "Erreur lors de la mise à jour du projet.");
            resp.sendRedirect("DisplayProjetServlet");
        }
    }


}
