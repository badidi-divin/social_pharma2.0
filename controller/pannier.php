<?php 
    if(isset($_POST['search']) || isset($_GET['action'])){

    $mot=isset($_POST['mot1'])?$_POST['mot1']:"";
    $requser=$pdo->prepare("SELECT * FROM plat WHERE designation=?");
    $requser->execute(array($mot));
    $userinfo=$requser->fetch();
    
    $erreur=false;
    $action=(isset($_POST['action'])?$_POST['action']:(isset($_GET['action'])?$_GET['action']:null));
    if($action!==null){
    if(!in_array($action, array('ajout','suppression','refresh')))

    //declaration des variables
        $erreur=true;
        $l=(isset($_POST['mot1'])?$_POST['mot1']:(isset($_GET['mot1'])?$_GET['mot1']:null));
        $q=(isset($_POST['q'])?$_POST['q']:(isset($_GET['q'])?$_GET['q']:null));
        $p=isset($userinfo['pv'])?$userinfo['pv']:"";
        //affectation des variables
       $l=preg_replace('#\v#', '', $l);
       $p=floatval($p);
       //tester la valeur de la quantité
       if(is_array($q)){

    $qteproduit=array();
    $i=0;
    foreach ($q as $contenu) {
        # code...
    $qteproduit[$i++]=intval($contenu);

    }
       }else{

    $q=intval($q);
       }
    }
    
    if(!$erreur){
    switch ($action) {
        case 'ajout':
            # code...
            ajouterArticle($l,$q,$p);
            break;
            case 'suppression':
            # code...
            supprimerArticle($l);
            break;
            case 'refresh':
            # code...
            for ($i=0; $i < count($qteproduit) ; $i++) { 
                # code...
    Modifierqteproduit($_SESSION['panier']['libelleproduit'][$i],round($qteproduit[$i]));
            }

            break;
        
            default:
            # code...
            break;
    }
   } 
   
}
    