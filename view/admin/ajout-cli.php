<?php 
      session_start();
      require_once('../../controller/client.php');
      require_once('securite.php');
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Impression</title>
    <link rel="stylesheet" href="css/test.css">
    <style type="text/css">
        @page
        {
            size:A4;
            margin:0; 

        }
        #print-btn{
            display: none;
            visibility: none;
        }
        .margetop{
            margin-top: 60px;
        }
        .spacer{
            margin-top: 10px;
        }
        .space{
            margin-top: 70px;
        }
        .spac{
            margin-top: 80px;
        }
        .a{
            text-align:center;
            text-decoration: blink;
        }
    </style>
</head>
<body>
<div class="contenair space col-md-6 col-xd-12 col-md-offset-3">
    <!-- panel default ce n'est que la couleur qui va changer -->
    <?php
                        if (!empty($errors)):
                                ?>
                                <div class="alert alert-danger">
                                    <p></p>
                                    <ul>
                                        <?php foreach($errors as $error):?>
                                            <li><?= $error; ?></li>
                                        <?php endforeach; ?>
                                    </ul>
                                </div>
                                <?php endif; ?>

                                <?php
                                if (!empty($success)):
                                ?>
                                <div class="alert alert-success">
                                    <p></p>
                                    <ul>
                                        <?php foreach($success as $succes):?>
                                            <li><?= $succes; ?></li>
                                        <?php endforeach; ?>
                                        <a href="client.php">voir la liste</a>
                                    </ul>
                                </div>
                                <?php endif; ?>
    <div class="panel panel-default">
        <div class="panel-heading">
                    
                            <h3 align="center">AJOUTER CLIENT</h3>
                            <a href="client.php">Retour>>>></a>
                        </div>
                        <div class="panel-body">
                            <form action="" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label>Nom Complet du client</label>
                                    <input class="form-control" type="text" name="nom_complet" placeholder="Nom Complet du client" required="required">
                                </div>
                                <div class="form-group">
                                    <label>Sexe</label>
                                    <select class="form-control" name="sexe">
                                        <option disabled>
                                            Choisissez un sexe
                                        </option>
                                        <option value="M">
                                            M
                                        </option>
                                        <option value="F">
                                            F
                                        </option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Télephone</label>
                                    <input class="form-control" type="number" name="phone" placeholder="+243817767357">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input class="form-control" type="email" name="email" placeholder="divinbadidi@gmail.com">
                                </div>
                                <div class="form-group">
                                    <label>Adresse Complète</label>
                                    <input class="form-control" type="text" name="adresse" placeholder="xxxxxxxxxxxxxxxxxxxxxxxx">
                                </div>
                                <div class="form-group" align="center">
                                    <button class="btn btn-success" type="submit" name="envoie2">Ajouter</button>
                                </div>
                            </form>
                        
                    </div>
                </div>
            </div>
        </div>

    </div>

    <?php require_once('footer.php'); ?>
</body>
</html>
<!-- end document-->