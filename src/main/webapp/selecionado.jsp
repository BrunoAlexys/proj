
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/selecionado.css">
    <link rel="stylesheet" href="css/resposta.css">
    <link rel="stylesheet" href="css/comentarios.css">
    <title>Title</title>
</head>
<body>
<header>
    <img id="logo" src="./src/imagens/transparent-movie-5.png"/>
    <nav>
        <ul>
            <a href="cine?action=HomeBean">
                <li>Home</li>
            </a>

            <a href="cine?action=FilmesBean">
                <li>Filmes</li>
            </a>

            <a href="cine?action=SeriesBean">
                <li>Series</li>
            </a>

            <a href="cine?action=LoginFormBean">
                <li>Login</li>
            </a>

            <button id="optionsButton"><i class="fas fa-user"></i></button>
            <div id="options-container">
                <div class="option" onclick="Alterar()">Alterar</div>
                <div class="option" onclick="sair()">Sair</div>
            </div>
        </ul>
    </nav>

    <script src="script.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</header>

<div id="banner"></div>
<div class="titulo"><H1>The BATMAN</H1>
    <h3>2022 · 2h 56m</h3>
</div>

<div id="trailer-conteiner">
    <div class="content">
        <video controls class="Trailer">
            <source src="https://www.youtube.com/watch?v=rsQEor4y2hg" type="video/mp4">
            Seu navegador não tem suporte para videos
        </video>
        <div id="sinopse">
            <p class="description">
                <br> Data de lançamento: 3 de março de 2022 (Brasil)
                <br> Diretor: Matt Reeves
                <br> Bilheteria: 771 milhões USD
                <br> Roteiro: Matt Reeves, Peter Craig
                <br> Em Portugal: The Batman
            </p>

        </div>
    </div>
</div>


<div class="wrapper">
    <h3>Avaliações</h3>
    <form action="#">
        <div class="rating">
            <input type="number" name="rating" hidden>
            <i class='bx bx-star star' style="--i: 0;"></i>
            <i class='bx bx-star star' style="--i: 1;"></i>
            <i class='bx bx-star star' style="--i: 2;"></i>
            <i class='bx bx-star star' style="--i: 3;"></i>
            <i class='bx bx-star star' style="--i: 4;"></i>
        </div>
        <textarea name="opinion" cols="30" rows="5" placeholder="Sua opinião..."></textarea>
        <div class="btn-group">
            <button type="submit" class="btn submit">Enviar</button>
            <button class="btn cancel">Cancel</button>
        </div>
    </form>
</div>
<div class="container">
    <div class="card-wrapper">
        <div class="card">
            <div class="head">

                <div class="profile">
                    <h3>John Doe</h3>
                    <p>RJ</p>
                </div>
            </div>
            <p class="review">
                Lorem ipsum dolor sit, amet, consectetur adipisicing elit. Ipsam repellat natus sed unde dignissimos vero nostrum accusantium accusamus obcaecati corrupti.
            </p>
            <div class="ratings">
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star-half' ></i>
            </div>
        </div>
        <div class="card">
            <div class="head">

                <div class="profile">
                    <h3>John Doe</h3>
                    <p>RJ</p>
                </div>
            </div>
            <p class="review">
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Modi, fugiat consequatur a recusandae magni! Veritatis esse pariatur quas vero eligendi quis dolores, nesciunt quasi assumenda magni eaque rem dicta non amet quaerat, eum, repudiandae temporibus aut corporis nostrum delectus voluptatibus deserunt ab nam! Ratione porro fugit nesciunt est.
            </p>
            <div class="ratings">
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star-half' ></i>
            </div>
        </div>
        <div class="card">
            <div class="head">

                <div class="profile">
                    <h3>John Doe</h3>
                    <p>RJ</p>
                </div>
            </div>
            <p class="review">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi ab neque, vel pariatur culpa minus dicta labore adipisci aliquid! Nemo, sequi! Ipsa error, cumque quaerat ut explicabo quisquam voluptates. Deserunt ratione cumque ipsum iusto itaque voluptates, cum, odio maxime repellat sed totam aut amet dolores sunt delectus! Veritatis, provident, iste!
            </p>
            <div class="ratings">
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star-half' ></i>
            </div>
        </div>
        <div class="card">
            <div class="head">

                <div class="profile">
                    <h3>John Doe</h3>
                    <p>RJ</p>
                </div>
            </div>
            <p class="review">
                Lorem ipsum dolor sit, amet consectetur, adipisicing elit. Perspiciatis eligendi magni asperiores ad amet dolores exercitationem eum facilis! Consequuntur consequatur nihil quia corrupti, similique temporibus adipisci et dicta ipsa, odio.
            </p>
            <div class="ratings">
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star-half' ></i>
            </div>
        </div>
        <div class="card">
            <div class="head">

                <div class="profile">
                    <h3>John Doe</h3>
                    <p>RJ</p>
                </div>
            </div>
            <p class="review">
                Lorem, ipsum dolor sit, amet consectetur adipisicing elit. Incidunt aliquid, in iure reprehenderit voluptatum inventore, praesentium quisquam ipsa deleniti molestiae voluptatem cupiditate repellat necessitatibus quos officiis sit repudiandae aut totam blanditiis quam odio maxime numquam eligendi?
            </p>
            <div class="ratings">
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star' ></i>
                <i class='bx bxs-star-half' ></i>
            </div>
        </div>
    </div>
    <div class="indicator">
    </div>
</div>
<footer>
    <img style="object-fit: contain;" id="logo" src="./src/imagens/transparent-movie-5.png"/>
    <span>Todos os direitos resevados</span>

    <nav class="footer-navgation">
        <ul class="footer-list">
            <a href="./index.html">
                <li>Home</li>
            </a>

            <a href="./Contato.html">
                <li>Con tato</li>
            </a>

            <a href="./Fotos.html">
                <li>Foto</li>
            </a>

            <a href="./Comentario.html">
                <li>Comentário</li>
            </a>
        </ul>
    </nav>
</footer>
<script>
    const allStar = document.querySelectorAll('.rating .star')
    const ratingValue = document.querySelector('.rating input')

    allStar.forEach((item, idx)=> {
        item.addEventListener('click', function () {
            let click = 0
            ratingValue.value = idx + 1

            allStar.forEach(i=> {
                i.classList.replace('bxs-star', 'bx-star')
                i.classList.remove('active')
            })
            for(let i=0; i<allStar.length; i++) {
                if(i <= idx) {
                    allStar[i].classList.replace('bx-star', 'bxs-star')
                    allStar[i].classList.add('active')
                } else {
                    allStar[i].style.setProperty('--i', click)
                    click++
                }
            }
        })
    })
</script>
<script src="js/selecionado.js"></script>
</body>
</html>
