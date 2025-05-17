<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Rehan Portfolio</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
  <link
    href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Sansation&display=swap"
    rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }


    html {
      scroll-behavior: smooth;
      /* smooth scroll for anchor links */
    }

    body {
      background: #1d1c1c;
      color: white;
      font-family: 'josefin sans', sans-serif;
      overflow-x: hidden;
    }

    .header {
      position: fixed;
      width: 100%;
      background-color: #1a1a1a;
      top: 0;
      left: 0;
      z-index: 1000;
    }

    nav {
      display: flex;
      background-color: transparent;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 2rem;
    }

    .nav__logo {
      font-size: 1.2rem;
      font-weight: bold;
      color: white;
    }

    .nav__logo span {
      color: cyan;
      text-shadow: 0 1px 4px cyan;
    }

    .nav__toggle {
      display: none;
      flex-direction: column;
      justify-content: space-between;
      width: 25px;
      height: 20px;
      cursor: pointer;
    }

    .nav__toggle span {
      display: block;
      height: 3px;
      background: white;
      border-radius: 2px;
    }

    .nav__list {
      display: flex;
      gap: 2rem;
      list-style: none;
    }

    .nav__link {
      text-decoration: none;
      color: white;
      transition: 0.3s;
    }

    .nav__link:hover {
      color: #00ffc3;
    }

    /* Backdrop overlay for mobile menu */
    .nav-backdrop {
      display: none;
      position: fixed;
      inset: 0;
      background-color: transparent;
      backdrop-filter: blur(4px);
      z-index: 999;
      opacity: 0;
      transition: 0.3s ease;
      pointer-events: none;
      /* prevent clicks when hidden */
    }

    .nav-backdrop.active {
      display: inline-block;
      opacity: 1;
      pointer-events: auto;
      /* allow clicks when active */
    }

    .hero {
      display: flex;
      flex-direction: column-reverse;
      align-items: center;
      justify-content: center;
      padding: 6rem 2rem 2rem;
      text-align: center;
    }

    .circle-wrapper {
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .circle {
      width: 200px;
      height: 200px;
      background-color: cyan;
      border-radius: 50%;
      overflow: hidden;
      display: flex;
      justify-content: center;
      align-items: center;
      box-shadow: 0 10px 50px cyan;
      /* Cyan glow shadow */
    }


    .circle img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .icon-container {
      display: flex;
      justify-content: center;
      transform: translateX(35px);
      gap: 20px;
      margin: 20px 0;
    }

    .icon {
      font-size: 30px;
      color: #ffffff;
      text-decoration: none;
      align-items: center;
      display: flex;
      gap: 100px;
      transition: transform 0.3s ease, text-shadow 0.3s ease;
      text-shadow: 0 0 8px #00ffff;
      margin-left: 2%;
    }

    .icon:hover {
      transform: scale(1.4);
      text-shadow: 0 0 15px cyan, 0 0 25px cyan;
      color: #00ffff;
    }


    .intro-text h1 {
      font-size: 2rem;
      margin-top: 10%;
    }

    .intro-text h1 span {
      color: cyan;
      text-shadow: 0 0 10px cyan;
    }

    .intro-text h3 {
      font-size: 1.3rem;
      margin: 0.5rem 0;
      position: static;
    }

    .intro-text p {
      color: white;
      margin-top: 5%;
    }

    /* Fixed wrapper to prevent shaking */


    .intro-text h3 span#typewriter {
      color: #00ffc3;
      font-weight: bold;
      white-space: nowrap;
      display: inline-block;
    }

    .intro-text h3 span {
      /* No animation on "I'm a", only on #typewriter */
      display: inline;
    }

    .intro-text p {
      font-size: 1rem;
    }

    .intro-buttons {
      display: flex;
      justify-content: center;
      /* Horizontal centering */
      align-items: center;
      gap: 1rem;
      margin: 2rem auto;
      /* Center container itself */
      width: 100%;
      /* Full width of parent */
      max-width: 100%;
      /* Prevent overflow */
      flex-wrap: wrap;
      /* Allow wrap on smaller screens */
    }

    .intro-buttons button {
      border: 2px solid cyan;
      background: transparent;
      color: cyan;
      border-radius: 30px;
      cursor: pointer;
      position: relative;
      overflow: hidden;
      z-index: 1;
      transition: color 0.3s ease;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 0.5rem 1rem;
      min-width: 120px;
    }



    .intro-buttons button::before {
      content: '';
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background: cyan;
      z-index: -1;
      transition: 0.3s ease;
    }


    .intro-buttons button:hover::before {
      width: 100%;
    }

    .section {
      padding: 3rem 1rem;
      text-align: center;
    }

    .skills-grid,
    .projects-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
      gap: 1rem;
      margin-top: 2rem;
    }

    @media (min: 768px) {

      .section {
        display: flex;
        width: 100%;
      }
    }



    .contact-form {
      max-width: 500px;
      margin: auto;
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }

    .contact-form input,
    .contact-form textarea {
      padding: 0.8rem;
      background: rgb(61, 65, 65);
      border: 1px solid transparent;
      border-radius: 10px;
      color: white;
    }

    .contact-form input:focus,
    .contact-form textarea:focus {
      outline: none;
      border-color: cyan;
      box-shadow: 0 0 10px cyan;
    }

    .contact-form button {
      background: rgb(64, 150, 163);
      color: rgb(240, 231, 231);
      padding: 0.8rem;
      border: none;
      border-radius: 30px;
      font-weight: bold;
      font-size: 1.3rem;
      font-family: 'josefin sans', sans-serif;

    }

    .contact-form button :hover {
      background: rgb(64, 150, 163);
      transform: translateY(-5px) scale(1.05);
      box-shadow: 0 0 10px rgb(64, 150, 163), 0 0 10px rgb(64, 150, 163);
    }

    .slide-in-left,
    .slide-in-bottom {
      opacity: 0;
      transform: translateY(20px);
      transition: all 0.6s ease-out;
    }

    .visible {
      opacity: 1;
      transform: translateY(0);
    }

    .buttons {
      display: flex;
      justify-content: flex-start;
      gap: 40px;
      z-index: 10;
      margin-top: 0px;
      position: relative;
    }

    .buttons .btn {
      padding: 10px 20px;
      background: rgb(64, 150, 163);
      position: relative;
      color: white;
      right: -60px;
      text-decoration: none;
      border-radius: 300px;
      transition: 0.3s ease;
      text-shadow: 0 0 8px rgb(64, 150, 163);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      z-index: 1;
      pointer-events: all;
      margin-top: 2rem;
    }

    .buttons :hover {
      background: rgb(64, 150, 163);
      transform: translateY(-5px) scale(1.05);
      box-shadow: 0 0 10px rgb(64, 150, 163), 0 0 10px rgb(64, 150, 163);
    }

    .card-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
      gap: 1rem;
      padding: 1rem;
    }

    .card {
      padding: 1.2rem;
      border: none;
      border-radius: 10px;
      transition: all 0.3s ease;
      background: transparent;
      display: flex;
      flex-direction: column;
      align-items: center;
      box-sizing: border-box;
    }

    .card-title {
      margin-bottom: 0px;
      font-size: 30px;
      text-align: center;
      color: cyan;
      text-shadow: cyan 0 0 10px;
    }

    .card img {
      width: 100%;
      height: auto;
      max-height: 500px;
      object-fit: contain;
      object-position: center;
      margin-top: 1rem;
      border-radius: 5px;
      filter: drop-shadow(0 0 10px cyan);
      transition: filter 0.3s ease;
    }

    .card:hover {
      background: transparent;
      color: rgb(238, 233, 233);
      transform: translateY(-10px);
      z-index: 1;
      outline: none;
    }

    /* Tablet (smaller padding, remove border) */
    @media (max-width: 768px) {
      .card {
        padding: 1rem;
        border: none;
      }

      .card-title {
        font-size: 24px;
      }

      .card img {
        max-height: 180px;
      }
    }

    /* Mobile (even more compact) */
    @media (max-width: 480px) {
      .card {
        padding: 0.5rem;
        border: none;
      }

      .card-title {
        font-size: 18px;
      }

      .card img {
        max-height: 120px;
      }
    }

    .footer {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      background: transparent;
      color: cyan;
      text-align: right;
      padding: 1rem 0;
      font-size: 11px;

    }

    @media (max-width: 768px) {
      .nav__list {
        display: none;
        position: fixed;
        top: 70px;
        right: 0;
        background-color: rgba(26, 26, 26, 0.9);
        backdrop-filter: blur(8px);
        flex-direction: column;
        width: 100%;
        padding: 2rem;
        gap: 1.5rem;
        z-index: 1000;
        transition: transform 0.3s ease;
        transform: translateX(100%);
      }

      .nav__list.active {
        display: flex;
        transform: translateX(0);
      }

      .nav__toggle {
        display: flex;
      }

      #typed {
        color: cyan;
        font-weight: bold;
        font-size: 30px;
      }
    }
  </style>
</head>

<body>
  <div id="chatbot-icon" style="
    position: fixed;
    bottom: 20px;
    right: 20px;
    cursor: pointer;
    z-index: 9999;
    width: 150px;
    height: auto;
    transition: transform 0.3s ease;
  " onmouseover="this.style.transform='scale(1.15)'" onmouseout="this.style.transform='scale(1)'">
    <img src="chatbot icon.gif" alt="Chat Icon" style="
      width: 100%;
      height: 100%;
      max-width: 100%;
      max-height: 100%;
      object-fit: contain;
      display: block;
    " />
  </div>



  <header class="header">
    <nav>
      <div class="nav__logo">REH<span>NOVA</span></div>
      <ul class="nav__list" id="nav-list">
        <li><a href="#home" class="nav__link">Home</a></li>
        <li><a href="#home" class="nav__link">Education</a></li>
        <li><a href="#services" class="nav__link">Services</a></li>
        <li><a href="#contact" class="nav__link">Contact</a></li>
      </ul>
      <div class="nav__toggle" id="nav-toggle">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </nav>
    <div class="nav-backdrop" id="nav-backdrop"></div>
  </header>

  <section class="hero" id="home">
    <div class="intro-text slide-in-left">
      <h1>Hi, I'M <span>REHAN</span></h1>
      <h1><span id="typed"></span></h1>
      <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.12"></script>

      <p>An AI Automation expert and SaaS builder, making AI-powered lead generation tools, chatbots, and small
        automations to help businesses grow.My focus is on simple, effective solutions that save time and drive results.
        Let's work together to automate your success.</p>
      <div class="icon-container slide-in-left">
        <a href="mailto:rbrehanbhatti786@gmail.com" class="icon"><i class="fas fa-envelope"></i></a>
        <a href="https://instagram.com/rehanbhatti__01" target="_blank" class="icon"><i
            class="fab fa-instagram"></i></a>
        <a href="https://github.com/RehanCorps" target="_blank" class="icon"><i class="fab fa-github"></i></a>
        <a href="https://wa.me/923425040554" target="_blank" class="icon"><i class="fab fa-whatsapp"></i></a>
      </div>
      <div class="buttons slide-in-left">
        <a href="#contact" class="btn">Hire Me</a>
        <a href="#projects" class="btn">Projects</a>
      </div>
    </div>
    <div class="circle-wrapper">
      <div class="circle slide-in-bottom">
        <img src="images/Untitled design (3).png" alt="Profile" />
      </div>
    </div>

    </div>

  </section>

  <section id="Education" class="section slide-in-left">
    <h2 class="section-title slide-in-left">Education</h2>
    <div style="display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 110fr)); align-items: center;
      gap: 0.5rem;
      margin-top: 2rem; max-width: 400px;">
      <div
        style="border: 1px solid cyan; border-radius: 20px; padding: 15px; width: 100%; backdrop-filter: blur(4px); background: rgba(0, 255, 255, 0.05);">
        <h3 style="margin: 8%;font-size: 1rem ;color: #00ffff; text-shadow: 0 0 5px cyan;">Diploma in ML and Deep
          leaning</h3>
        <p>PEC initiative</p>
        <p style="font-size: 14px;margin: 5%; color: #ccc;">2023 - 2024</p>
      </div>
      <div
        style="border: 1px solid cyan; border-radius: 20px; padding: 15px; width: 100%; backdrop-filter: blur(4px); background: rgba(0, 255, 255, 0.05);">
        <h3 style="margin: 8%; font-size: 1rem ; color: #00ffff; text-shadow: 0 0 5px cyan;">Diploma of AI In Marketing
        </h3>
        <p>PEC initiative</p>
        <p style="font-size: 14px;margin: 5%; color: #ccc;">2023 - 2024</p>
      </div>
      <div
        style="border: 1px solid cyan; border-radius: 20px; padding: 15px; width: 100%; backdrop-filter: blur(4px); background: rgba(0, 255, 255, 0.05);">
        <h3 style="margin: 8%; font-size: 1rem; color: #00ffff; text-shadow: 0 0 5px cyan;">Diploma in Data analysis
        </h3>
        <p>PEC initiative</p>
        <p style="font-size: 14px;margin: 5%; color: #ccc;">2022 - 2023</p>
      </div>
      <div
        style="border: 1px solid cyan; border-radius: 20px; padding: 15px; width: 100%; backdrop-filter: blur(4px); background: rgba(0, 255, 255, 0.05);">
        <h3 style="margin: 8%; font-family: 1rem; color: #00ffff; text-shadow: 0 0 5px cyan;">Intermediate in
          Pre-Engineering</h3>
        <p>Punjab College Jand</p>
        <p style="font-size: 14px; margin: 5%; color: #ccc;">2022 - 2023</p>
      </div>
    </div>
  </section>
  <section id="Education" class="section slide-in-left">
    <h2 class="section-title slide-in-left">Skills</h2>
    <div class="card-container">
      <div class="card">
        <h3 class="card-title">AI Automation</h3>
        <img src="ai automation.png" alt="Image 1">
      </div>
      <div class="card">
        <h3 class="card-title">Chatbot Development</h3>
        <img src="chatbot.png" alt="Image 1">
      </div>
      <div class="card">
        <h3 class="card-title">SAAS Automation</h3>
        <img src="saas.png" alt="Image 2">
      </div>
      <div class="card">
        <h3 class="card-title">Web Development</h3>
        <img src="web dev.png" alt="Image 3">
      </div>
      <div class="card">
        <h3 class="card-title">Math Expertise</h3>
        <img src="math.png" alt="Image 3">
      </div>
      <div class="card">
        <h3 class="card-title">Lead Gen</h3>
        <img src="lead gen.png" alt="Image 3">
      </div>
      <!-- Add more cards -->
    </div>

  </section>
  <section id="contact" class="section slide-in-bottom">
    <h2 class="section-title slide-in-bottom">Contact<span style="color: cyan;"> Me</h2>
    <form class="contact-form slide-in-bottom">
      <input type="text" placeholder="Full Name">
      <input type="email" placeholder="Email">
      <input type="text" placeholder="Phone Number">
      <input type="text" placeholder="Subject">
      <textarea placeholder="Your Message"></textarea>
      <button type="submit" class="btn">Send Message</button>
    </form>
  </section>
  <script src="https://cdn.jsdelivr.net/npm/typewriter-effect@2.18.0/dist/core.js"></script>
  <script>
    // Intersection animations
    const slideElements = document.querySelectorAll('.slide-in-left, .slide-in-bottom');
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
        } else {
          entry.target.classList.remove('visible');
        }
      });
    }, {
      threshold: 0.2
    });
    slideElements.forEach(el => observer.observe(el));

    // Typewriter effect

    var typed = new Typed("#typed", {
      strings: ["Web Developer", "Chatbot Builder", "Automation Expert"],
      typeSpeed: 60,
      backSpeed: 40,
      loop: true,
    });


    // Mobile menu toggle
    const navToggle = document.getElementById('nav-toggle');
    const navList = document.getElementById('nav-list');
    const navBackdrop = document.getElementById('nav-backdrop');

    navToggle.addEventListener('click', () => {
      const isActive = navList.classList.toggle('active');
      if (isActive) {
        navBackdrop.classList.add('active');
      } else {
        navBackdrop.classList.remove('active');
      }
    });

    // Close mobile menu when clicking on backdrop
    navBackdrop.addEventListener('click', () => {
      navList.classList.remove('active');
      navBackdrop.classList.remove('active');
    });

    // Also close mobile menu on clicking a nav link (better UX)
    document.querySelectorAll('.nav__link').forEach(link => {
      link.addEventListener('click', () => {
        navList.classList.remove('active');
        navBackdrop.classList.remove('active');
      });
    });
  </script>

  <iframe id="chatbot-frame"
    src="https://cdn.botpress.cloud/webchat/v2.4/shareable.html?configUrl=https://files.bpcontent.cloud/2025/04/03/07/20250403075607-YQ76CUCX.json"
    style="display:none; position: fixed; bottom: 100px; right: 20px; width: 350px; height: 500px; border: none; border-radius: 12px; z-index: 9998;">
  </iframe>

  <script>
    const chatIcon = document.getElementById('chatbot-icon');
    const chatFrame = document.getElementById('chatbot-frame');

    chatIcon.addEventListener('click', () => {
      if (chatFrame.style.display === 'none' || chatFrame.style.display === '') {
        chatFrame.style.display = 'block';
      } else {
        chatFrame.style.display = 'none';
      }
    });
  </script>

</body>
<footer class="footer">
  &copy; 2025 RehanCorps. All rights reserved.
</footer>

</html>
