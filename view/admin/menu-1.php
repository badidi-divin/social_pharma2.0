<ul class="navbar-mobile__list list-unstyled">
                 <?php
                        if ($_SESSION['role']=="admin-1" || $_SESSION['role']=="admin-2") {
                            ?>
                             <li class="has-sub">
                            <a class="js-arrow" href="rapport.php">
                                Tableau de bord</a>
                        </li>
                            <?php
                        }
                       
                    ?>
                        <li class="has-sub">
                            <a class="js-arrow" href="client.php">
                                Client</a>
                        </li>
                    

                        <li>
                            <a href="produit.php">
                              Approvisionnement</a>
                        </li>

                        <li>
                            <a href="stock.php">
                              Stock</a>
                        </li>

                        <li>
                            <a href="../pannier.php">
                                Vente</a>
                        </li>
                     <?php
                        if ($_SESSION['role']=="admin-1" || $_SESSION['role']=="admin-2") {
                            ?>
                         <li>
                            <a href="commande2.php" title="Rapport des commandes">
                               Rapport de vente</a>
                        </li>
                         <li>
                            <a href="commande2.php" title="Rapport des commandes">
                               Proforma</a>
                        </li>
                        <li>
                            <a href="utilisateur.php">
                                Utilisateur</a>
                        </li>
                        <li>
                            <a href="parametres.php">
                                Paramètre</a>
                        </li>
                           <?php
                        }
                       
                    ?>
                     <li>
                           <a href="ai.pdf">
                                Besoin d'aide?</a>
                        </li>
                    </ul>