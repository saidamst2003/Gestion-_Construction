package com.GestionProject.servlet;

import com.GestionProject.dao.TacheDao;
import com.GestionProject.model.Tache;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;


@WebServlet("/AddTach")
public class Addtacheservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // Récupération des paramètres du formulaire
            String descriptionTache = request.getParameter("descriptionTache");
            System.out.println(descriptionTache);
            Date dateDebutTache = Date.valueOf(request.getParameter("dateDebutTache"));
            Date dateFinTache = Date.valueOf(request.getParameter("dateFintTache"));
            int idProjet = Integer.parseInt(request.getParameter("idProjet"));

                 Tache tache = new Tache(descriptionTache, dateDebutTache, dateFinTache, idProjet);

        int result = TacheDao.inserTache(tache);
        if (result > 0) {
                response.sendRedirect("DisplayTache");
        } else {
                request.setAttribute("errorMessage", "Erreur lors de l'ajout de la tâche.");
                response.sendRedirect("DioosplayTache");
        }
    }
}


