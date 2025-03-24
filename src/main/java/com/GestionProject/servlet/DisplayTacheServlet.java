package com.GestionProject.servlet;

import com.GestionProject.dao.TacheDao;
import com.GestionProject.model.Tache;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayTache")
public class DisplayTacheServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        List<Tache> listeTaches = TacheDao.displaytache();
        request.setAttribute("taches", listeTaches);
        request.getRequestDispatcher("/GestionTache.jsp").forward(request, response);
    }

  }

