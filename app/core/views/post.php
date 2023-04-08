<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="public/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Post</title>
</head>
<body>
    <?php
        session_start();

        $slug = $_GET['slug'];
        require_once 'app/core/controllers/post.php';

        $post = new Post();
        $payload = $post -> details($slug);
        echo '
            <div>

                <h3>'.$payload['title'].'</h3>

                <img style="width: 30%" src="'.$payload['banner'].'" alt="">

                <p>'.$payload['body'].'</p>
  
            </div>
        ';
    ?>

    <form action="" method="post">
        <label for="comment">Ajouter un commentaire</label> <br><br>
        <textarea name="comment" id="comment" cols="50" rows="8" placeholder="Saisissez un votre commentaire"></textarea> <br><br>
        <input type="submit" name="save" value="Ajouter commentaire">
    </form>

    <?php

        if (isset($_POST['save'])) {

            $body = $_POST['comment'];
            $author = $_SESSION['user_info'][0]['id'];
            $post_id = $payload['id'];

            $post -> add_comment($body, $author, $post_id);

        }

        $is_liked = $post -> check_like($_SESSION['user_info'][0]['id'], $payload['id']);
    ?>

    <!-- <br> -->
    <hr>
        <form action="" method="post">
            <button type="submit" name="like">
                <?php 
                    //echo $is_liked ? '<i class="far fa-thumbs-up"></i>' : '<i class="far fa-thumbs-down"></i>'; 
                    if ($is_liked == false) {
                        echo '<i class="far fa-thumbs-up"></i>';
                    } else {
                        echo '<i class="far fa-thumbs-down"></i>';
                    }

                    if (isset($_POST['like'])) {
                        $post -> like_post($payload['id'], $_SESSION['user_info'][0]['id'], $is_liked);
                    }
                ?>
            </button>

        </form>
    <hr>

    <h3>Section commentaire</h3>

    <hr>

    <?php

        $comments = $post -> get_comment($payload['id']);
        while ($comment = $comments -> fetch()) {
            $user = $post -> get_comment_author($comment['author']);
            $author_name = $user -> fetch();
            echo '
                <div>

                    <h3>'.$author_name['username'].'</h3>

                    <p>'.$comment['body'].'</p>

                </div>
               
                <button onclick="display_form('.$comment['id'].')">Réponre</button>
    
                <form action="" id='.$comment['id'].' method="post" hidden>
                    <label for="reply">Répondre</label> <br><br>
                    <textarea name="reply" id="reply" cols="50" rows="8" placeholder="Saisissez un votre réponse"></textarea> <br><br>
                    <input type="text" hidden name="parent" value='.$comment['id'].' >
                    <input type="submit" name="_reply" value="Envoyer">
                </form>

                <hr>
            ';

            $replies = $post -> get_replies($payload['id'], $comment['id']);

            while ($reply = $replies -> fetch()) {
                $_user = $post -> get_comment_author($reply['author']);
                $_author_name = $_user -> fetch();
            echo '
                <div style="margin-left: 50px">

                    <h3>'.$_author_name['username'].'</h3>

                    <p>'.$reply['body'].'</p>

                </div>

                <hr>
            ';
            }

        }

        if (isset($_POST['_reply'])) {
            $post -> reply_to_comment ($_POST['reply'], $_SESSION['user_info'][0]['id'], $payload['id'], $_POST['parent']);
        }
    ?>
    
    <script src="./public/js/main.js"></script>
</body>
</html>