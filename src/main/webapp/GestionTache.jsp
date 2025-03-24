
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.GestionProject.model.Projet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.GestionProject.model.Tache" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Gestion des Tâches</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: url('img/j.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .sidebar .nav-link i {
            margin-right: 8px;
        }

        .navbar {
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .navbar-brand {
            color: #2b5797;
            font-weight: bold;
        }
        .card {
            margin-bottom: 20px;
            border: none;
            margin-top: 100px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .btn-blue {
            background-color: #2b5797;
            border-color: #2b5797;
            color: white;
        }
        .btn-blue:hover {
            background-color: #1e3c6a;
            border-color: #1e3c6a;
            color: white;
        }

        .status-en-cours {
            background-color: #0d6efd;
            color: #fff;
        }

        .resource-badge {
            background-color: #6c757d;
            margin-right: 5px;
            font-size: 0.8rem;
        }
        .task-priority-high {
            border-left: 5px solid #dc3545;
        }

        .progress {
            height: 10px;
        }
        @media (max-width: 767.98px) {

        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-primary" href="index.jsp">
            <i class="fas fa-hard-hat me-2"></i>ConstructionXpert
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link me-3" href="Dashboard.jsp">
                        <i class="fas fa-tachometer-alt"></i> Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link me-3" href="/Gestion_de_Projets/DisplayProjetServlet">
                        <i class="fas fa-project-diagram"></i> Projets
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active me-3" href="GestionTache.jsp">
                        <i class="fas fa-tasks"></i> Tâches
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<%
    List<Tache> taches = (List<Tache>) request.getAttribute("taches");
    if (taches != null && !taches.isEmpty()) {
%>
<% for (Tache t : taches) { %>

<!-- Tasks List -->
<div class="card">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Projet</th>
                    <th>Description</th>
                    <th>Date Début</th>
                    <th>Date Fin</th>
                </tr>
                </thead>
                <tbody>
                <tr class="task-priority-high">
                    <td>
                        <div class="fw-bold"><%= t.getIdProjet() %></div>
                    </td>
                    <td>
                        <div class="fw-bold"><%= t.getDescriptionTache() %></div>
                    </td>
                    <td>
                        <div><i class="far fa-calendar-alt me-1"></i> Début: <%= t.getDateDebutTache() %></div>

                    </td>
                    <td>
                        <div><i class="far fa-calendar-check me-1"></i> Fin: <%= t.getDateFintTache() %></div>
                </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<% }  %>
<% } %>

</div>
</main>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function editTask(taskId) {

        document.getElementById('editTaskId').value = taskId;

        document.getElementById('editTaskDescription').value = "Fondation bâtiment principal";
        document.getElementById('editTaskStartDate').value = "2025-04-01";
        document.getElementById('editTaskEndDate').value = "2025-04-15";
        document.getElementById('editTaskResponsible').value = "John Doe";
        document.getElementById('editTaskProgress').value = "75";
        document.getElementById('editTaskResources').value = "Béton, Acier, Excavatrice";
    }

    // Function to set the task ID for deletion
    function setDeleteTaskId(taskId) {
        document.getElementById('deleteTaskId').value = taskId;
    }
</script>

</body>
</html>