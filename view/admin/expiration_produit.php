<?php 
    session_start();
    require_once('../../model/connexion.php');


    if (isset($_GET['mot1']) && $_GET['mot2']==""){
        $mot1=$_GET['mot1'];
        $requete="SELECT * FROM plat WHERE designation='$mot1'";           
    }else if(isset($_GET['mot2']) && $_GET['mot1']==""){
        $mot2=$_GET['mot2'];
        $requete="SELECT * FROM plat WHERE type='$mot2'";    
    }else{
        $requete="SELECT * FROM plat"; 
    }
    $resultat=$pdo->query($requete);
    
    require_once '../../controller/parametre-select2.php';
    require_once('securite.php');
    $nav="produit";
    if (isset($_GET['export10'])==1) {
        header('location:expiration_export.php');
    }
 ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once('header.php'); ?>

</head>

<body>
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                    <h4>
                    Sociale Pharma 3.0
                </h4>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <?php require_once('menu-1.php'); ?>
                </div>
            </nav>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
            <h4>
                    Sociale Pharma 3.0
                </h4>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                 <nav class="navbar-sidebar">
                <ul class="list-unstyled navbar__list">
                        <?php if ($_SESSION['role']=='admin-1' || $_SESSION['role']=='admin-2') {
                        ?>
                         <li>
                            <a   class="nav-item" href="rapport.php">
                                Tableau de bord</a>
                        </li>

                    <?php
                    } ?>
                        <li>
                            <a   class="nav-item" href="fournisseur.php">
                                Fournisseurs</a>
                        </li>
                        <li>
                            <a  class="nav-item" href="facture.php">
                                Facture Fournisseur</a>
                        </li>
                        <li>
                            <a  class="nav-item" href="produit.php">
                               Approvisionnement</a>
                        </li>
                        <li class="active">
                            <a href="expiration_produit.php">
                              Suivre les dates d'expiration</a>
                        </li>

                        <li>
                            <a  class="nav-item" href="client.php">
                                Client</a>
                        </li>
                       
                        <li class="has-sub">
                            <a  href="stock.php"  class="nav-item">
                              Stock</a>
                        </li>
                        <li class="has-sub">
                            <a  href="../pannier.php" class="nav-item">
                                Vente</a>
                        </li>


                         <?php
                        if ($_SESSION['role']=="admin-1" || $_SESSION['role']=="admin-2") {
                            ?>
                     
                         <li class="has-sub">
                            <a  href="commande2.php" title="Rapport des commandes" class="nav-item">
                               Rapport de vente</a>
                        </li>
                        <li class="has-sub">
                            <a  href="proformas.php" title="Rapport des commandes"  class="nav-item">
                               Proformas</a>
                        </li>
                        
                        <li class="has-sub">
                            <a  href="utilisateur.php" class="nav-item">
                                Utilisateur</a>
                        </li>
                        <li class="has-sub">
                            <a href="parametres.php"  class="nav-item">
                                Paramètre</a>
                        </li>
                           <?php
                        }
                       
                    ?>
                     <li class="has-sub">
                           <a href="ai.pdf" class="nav-item">
                                Besoin d'aide?</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="GET">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="designation..." name="mot1" />
                                </div>
                                <div class="form-group">
                                        <select name="mot2" id="" class="form-control">
                                <?php
                                            $ps=$pdo->prepare("SELECT * FROM facture");
                                            $ps->execute();
                                            ?>
                                                <option value="">
                                                    Tous
                                                </option>
                                                <?php
                                            while ($s=$ps->fetch(PDO::FETCH_OBJ)) {
                                                ?>
                                                <option value="<?php echo $s->num_facture; ?>">
                                                    <?php echo $s->num_facture."(".$s->entreprise.")"; ?>
                                                </option>
                                                <?php
                                            }
                                        ?>
                                </select> 
                               </div>
                               <div class="form-group">
                                <button class="btn btn-primary" type="submit" name="search">
                                        <i class="zmdi zmdi-search"></i>
                                </button>
                                        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                        <button class="btn btn-success" title="Exporter vers Excel" name="export10">Excel</button>
                                        
                                        &nbsp;&nbsp;
                                        <a href="expiration_produit.php" class="btn btn-success">Actualiser</a>
                                    
                                </div>
                            </form>                            
                        </div>
                    </div>
                </div>
            </header>
            <!-- END HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive table--no-card m-b-30">
                                    <table class="table table-borderless table-striped table-earning">
                                        <thead>
                                            <tr>
                                                
                                                <th>DESIGNATION</th>
                                                <th>ETAT</th>
                                                <th>DATE_EXPIRATION</th>
                                                <th>DATE_ENTREE</th>
                                                <th>DATE_AUJOURD'HUI</th>
                                                <th>FACTURE</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                              <?php while ($et=$resultat->fetch()){?>
                                            <tr>
                                                <td><?php  echo($et['designation'])?></td>
                                                 <td><?php   
                                                        $date_exp=strtotime($et['date_exp']);
                                                        $date_now=strtotime(date("Y-m-d"));
                                                        $expirer=$date_exp-$date_now;
                                                        if ($expirer>0) {
                                                            echo '<p style="color:green">'."Produit non expiré!".'</p>';
                                                        }else{
                                                            echo '<p style="color:red">'."Produit expiré!".'</p>';
                                                        }
                                                ?></td>
                                                <td><?php  echo($et['date_exp'])?></td>
                                                <td><?php  echo($et['date_entree'])?></td>
                                                <td><?php  echo date("Y-m-d")?></td>

                                                <td><?php  echo($et['type'])?></td>
                                         
                                             </tr>
                                               <?php
                                            }
                                                ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Copyright © 2024. All rights reserved. by <a href="#">Jonathan LEMA</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="modal fade" id="completeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h2 class="modal-title" id="exampleModalLabel">Critère d'Impression</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form method="get" action="imprimer_approv.php">
                <div class="form-group">
                        <label>Facture Fournisseur:</label>
                       <select name="nom" id="" class="form-control"> 
                           <option value="">
                           Tous
                       </option>   
                       <?php 
                    $requete="SELECT * FROM facture";    
                    $resultat=$pdo->query($requete);
                       while ($et=$resultat->fetch()){?>
                       
                           <option value="<?php  echo($et['num_facture'])?>">
                                <?php  echo($et['num_facture']."(".$et['entreprise'].")")?>  
                           </option>
                        <?php
                            }
                        ?>
                       </select>
                      </div>
                    <div class="form-group">
                        <label>Date:</label>
                       <input type="date" name="dates" id="" class="form-control">
                      </div>
                    <div class="modal-footer">
                    <button type="submit" class="btn btn-success" name="envoie9">Imprimer</button>

                <button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
              </div>
                </form>
            </div>
          </div>
        </div>
    </div>

    <div class="modal fade" id="completeModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h2 class="modal-title" id="exampleModalLabel">Critère d'Impression</h2>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form method="get" action="imprimer_approv2.php">
                <div class="form-group">
                    <label>De:</label>
                   <input type="date" name="de" id="" class="form-control">
                  </div>
                  <div class="form-group">
                    <label>A:</label>
                   <input type="date" name="a" id="" class="form-control">
                  </div>
                <div class="modal-footer">
                <button type="submit" class="btn btn-success" name="envoie9">Imprimer</button>

            <button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
          </div>
            </form>
        </div>
      </div>
    </div>

   <?php require_once('footer.php'); ?>

</body>

</html>
<!-- end document-->
