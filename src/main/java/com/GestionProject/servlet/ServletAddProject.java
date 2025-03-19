package com.GestionProject.servlet;

import com.GestionProject.model.Projet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;


@WebServlet("/AddProjet")
public class ServletAddProject extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            String nom = req.getParameter("nomProjet:");
            String description = req.getParameter("description");
            String dateDebut =req.getParameter(" dateDebut");
            Date dateDebuts =Date.valueOf(dateDebut);
            String dateFin =req.getParameter("dateFin");
            Date datefin =Date.valueOf(dateFin);
            String budget  = req.getParameter("budget");
            Double Budget = Double.valueOf(budget);
            

        Projet projet = new Projet(nom,description,dateDebuts,datefin,Budget);

           }


}
