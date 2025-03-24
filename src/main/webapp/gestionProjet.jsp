<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.GestionProject.model.Projet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.GestionProject.model.Tache" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert </title>
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
        .main-content {
            padding: 20px;
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
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .btn-orange {
            background-color: #ffa500;
            border-color: #ffa500;
            color: white;
        }
        .btn-orange:hover {
            background-color: #e69500;
            border-color: #e69500;
            color: white;
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
        @media (max-width: 767.98px) {

            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top shadow">
    <div class="container-fluid">

        <a class="navbar-brand fw-bold text-primary" href="home.jsp">
            <i class="fas fa-hard-hat me-2"></i>ConstructionXpert
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active me-3" href="Dashboard.jsp">
                        <i class="fas fa-tachometer-alt"></i> Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link me-3" href="/Gestion_de_Projets/DisplayProjetServlet">
                        <i class="fas fa-project-diagram"></i> Projets
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!-- Main Content -->
<main class="main-content">
    <div class="container-fluid pt-5 mt-3">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h2">Gestion des Projets</h1>
            <button class="btn btn-orange" data-bs-toggle="modal" data-bs-target="#addProjectModal">
                <i class="fas fa-plus me-2"></i>Nouveau Projet
            </button>
        </div>
        <%
            List<Projet> projets = (List<Projet>) request.getAttribute("projets");
            if (projets != null && !projets.isEmpty()) {
        %>
        <% for (Projet p : projets) { %>
        <!-- Projects List -->
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>

                            <th>Nom du Projet</th>
                            <th>Description</th>
                            <th>Date de début</th>
                            <th>Date de fin</th>
                            <th>Budget</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>

                            <td><%= p.getNomProjet() %></td>
                            <td><%= p.getDescriptionProjet() %></td>
                            <td><%= p.getDateDebut() %></td>
                            <td><%= p.getDateFin() %></td>
                            <td><%= p.getBudget() %></td>
                            <td>
                                <button  onclick="openModal(<%= p.getIdProjet()%>)" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#viewTasksModal"><i class="fas fa-tasks me-1"></i></button>
                                <%-- modifier un projet--%>

                                <button class="btn btn-sm btn-info" data-bs-toggle="modal"
                                        onclick="updateProject('<%= p.getIdProjet() %>', '<%= p.getNomProjet() %>', '<%= p.getDescriptionProjet() %>', '<%= p.getDateDebut() %>', '<%= p.getDateFin() %>', '<%= p.getBudget() %>')"
                                        data-bs-target="#editProjectModal">
                                    <i class="fas fa-edit me-1"></i>
                                </button>

                                <%-- suppression de projet--%>
                                <form action="SupprimerProject" method="post">
                                    <input type="hidden" name="idProjet" value="<%= p.getIdProjet() %>">
                                    <button class="btn btn-sm btn-danger"  data-bs-toggle="modal" data-bs-target="#deleteProjectModal"><i class="fas fa-trash me-1"></i></button>
                                </form>

                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <% } %>
        <% } %>
    </div>
</main>


<!-- Add Project Modal -->
<div class="modal fade" id="addProjectModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ajouter un nouveau projet</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addProjectForm" action="AddProjet"  method="post">

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="projectName" class="form-label">Nom du projet</label>
                            <input type="text" class="form-control" name="nomProjet" id="projectName" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="projectDescription" class="form-label">Description</label>
                        <textarea class="form-control" name="description" id="projectDescription" rows="3" required></textarea>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="projectStartDate" class="form-label">Date de début</label>
                            <input type="date" class="form-control" name="dateDebut" id="projectStartDate" required>
                        </div>
                        <div class="col-md-6">
                            <label for="projectEndDate" class="form-label">Date de fin</label>
                            <input type="date" class="form-control" name="dateFin" id="projectEndDate" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="projectBudget" class="form-label">Budget (dh)</label>
                        <input type="number" name="budget" class="form-control" id="projectBudget" min="0" step="1000" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-blue">Enregistrer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Edit Project Modal -->
<div class="modal fade" id= "editProjectModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modifier le projet</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id= "editProjectForm" action= "/Gestion_de_Projets/DisplayProjetServlet" method= "post">
                    <div class="row mb-3">
                        <input type="hidden" id="editId"  name= "idProjet" >

                        <div class="col-md-6">
                            <label for="editProjectName" class="form-label">Nom du projet</label>
                            <input type="text" class="form-control"  name= "nomProjet" id= "editProjectName" value="Tour Résidentielle Horizon" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="editProjectDescription"  class="form-label">Description</label>
                        <textarea class="form-control"  name="description" id="editProjectDescription" rows="3" required>Construction d'une tour résidentielle de 20 étages</textarea>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="editProjectStartDate"  class="form-label">Date de début</label>
                            <input type="date" class="form-control" name="dateDebut" id="editProjectStartDate" value="2025-03-10" required>
                        </div>
                        <div class="col-md-6">
                            <label for="editProjectEndDate"  class="form-label">Date de fin</label>
                            <input type="date" name="dateFin" class="form-control" id="editProjectEndDate" value="2026-09-15" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="editProjectBudget" class="form-label">Budget (DH)</label>
                        <input type="number" class="form-control"  name="budget" id= "editProjectBudget" value="1200000" min="0" step="1000" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-blue" >Mettre à jour</button>
                    </div>


                </form>
            </div>



        </div>
    </div>
</div>


<%--ADD TASK--%>
<div class="modal fade" id="addTaskModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ajouter une nouvelle tâche</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addTaskForm" action="AddTach" method="post">

                    <input type="hidden" name="idProjet" id="idProjet">

                    <div class="row mb-3">
                        <div class="col-md-8">
                            <label for="taskDescription" class="form-label">Description de la tâche</label>
                            <input type="text" class="form-control" name="descriptionTache" id="taskDescription" required>
                        </div>

                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="taskStartDate" class="form-label">Date de début</label>
                            <input type="date" class="form-control" name="dateDebutTache" id="taskStartDate" required>
                        </div>
                        <div class="col-md-6">
                            <label for="taskEndDate" class="form-label">Date de fin</label>
                            <input type="date" class="form-control" name="dateFintTache" id="taskEndDate" required>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-blue">Enregistrer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Project Modal -->
<div class="modal fade" id="deleteProjectModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirmer la suppression</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Êtes-vous sûr de vouloir supprimer ce projet? Cette action est irréversible.</p>
                <p><strong>Note:</strong> Toutes les tâches associées à ce projet seront également supprimées.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-danger" onclick="deleteProject()">Supprimer</button>
            </div>
        </div>
    </div>
</div>

<!-- View Tasks Modal -->


<div class="modal fade" id="viewTasksModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Tâches du projet:</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <div class="d-flex justify-content-end mb-3">
                    <button class="btn btn-orange" data-bs-toggle="modal" data-bs-target="#addTaskModal">
                        <i class="fas fa-plus me-2"></i>Nouvelle Tâche</button>
                </div>
            </div>

                <div class="table-responsive">

                    <%
                        List<Tache> taches = (List<Tache>) request.getAttribute("taches");
                        if (taches != null && !taches.isEmpty()) {
                    %>
                    <% for (Tache t : taches) { %>
                </>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Description</th>
                            <th>Date de début</th>
                            <th>Date de fin</th>
                        </tr>
                        </thead>
                    <tbody>
                        <tr>
                            <td><%=t.getDescriptionTache()%>></td>
                            <td><%=t.getDateDebutTache()%></td>
                            <td><%=t.getDateFintTache()%>></td>
                        <td>
                                <span class="badge bg-secondary">Béton</span>
                                <span class="badge bg-secondary">Acier</span>
                                <span class="badge bg-secondary">Excavatrice</span>
                            </td>
                            <td><span class="badge bg-success">En cours</span></td>
                            <td>
                                <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editTaskModal"><i class="fas fa-edit"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                            </td>

                        </tr>

                        </tbody>
                        <%}
                        }%>

               </div>
         </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
        function updateProject(id, name, description, startDate, endDate, budget) {
        document.getElementById('editId').value = id;
        document.getElementById('editProjectName').value = name;
        document.getElementById('editProjectDescription').value = description;
        document.getElementById('editProjectStartDate').value = startDate;
        document.getElementById('editProjectEndDate').value = endDate;
        document.getElementById('editProjectBudget').value = budget;
    }


function deleteProject() {
 console.log("Deleting project");

alert("Projet supprimé avec succès!");
bootstrap.Modal.getInstance(document.getElementById('deleteProjectModal')).hide();

}


function openModal(id){
            document.getElementById("addTaskModal").style.display='block';
            document.getElementById("idProjet").value = id;
}
</script>
</body>
</html>
